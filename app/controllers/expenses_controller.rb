# frozen_string_literal: true

class ExpensesController < ApplicationController
  before_action :find_group, only: %i[show new create]

  def index
    respond_to do |format|
      format.csv do
        send_data GenerateBillJob.perform_now(params[:expense_id]),
                  filename: "bill-#{DateTime.now.strftime('%d%m%Y%H%M')}.csv"
      end
    end
  end

  def show
    @expense = Expense.find(params[:id])
    @liabilities = @expense.liabilities
  end

  def new
    @expenses = Expense.new
    @group_id = params[:group_id]
    @categories = %w[Rent Transportation Groceries Food Education Health]
    @friends = @group.users
  end

  def create
    expense = Expense.create expense_params
    friends = @group.users.ids

    liabilities_created = create_liabilities friends, expense

    if liabilities_created && expense
      redirect_to group_path(@group.id)
    else
      render new
    end
  end

  private

  def expense_params
    params.permit :category, :name, :currency, :expense, :group_id
  end

  def create_liabilities(friends, expense)
    friend_paid = params[:friend].to_i
    total_amount = expense.expense
    split_amount = total_amount / friends.count
    creditor_amount = total_amount - split_amount

    Liability.transaction do
      liabilities = []
      friends.each do |friend|
        liabilities << if friend == friend_paid
                         Liability.new(name: 'credit', user_id: friend, expense_id: expense.id, amount: creditor_amount)
                       else
                         Liability.new(name: 'debit', user_id: friend, expense_id: expense.id, amount: split_amount,
                                       liable_to: friend_paid)
                       end
      end
      Liability.import! liabilities
    rescue ActiveRecord::RecordInvalid => e
      false
    end
  end

  def find_group
    @group = Group.find params[:group_id]
  end
end
