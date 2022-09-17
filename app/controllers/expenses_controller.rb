class ExpensesController < ApplicationController
  before_action :find_group, only: %i[show new create]

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

    create_liabilities friends, expense

    redirect_to group_path(@group.id)
  end

  private

  def expense_params
    params.permit :category, :name, :expense, :group_id
  end

  def create_liabilities friends, expense
    friend_paid = params[:friend].to_i
    total_amount = expense.expense
    split_amount = total_amount / friends.count

    Liability.transaction do 
      liabilities = []
      friends.each do |friend|
        if friend == friend_paid
          liabilities << Liability.new(name: 'credit', user_id: friend, expense_id: expense.id, amount: split_amount)
        else
          liabilities << Liability.new(name: 'debit', user_id: friend, expense_id: expense.id, amount: split_amount)
        end
      end
      Liability.import! liabilities
    end
  end

  def find_group
    @group = Group.find params[:group_id]
  end

end