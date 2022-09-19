# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_group, only: %i[show edit update destroy]
  before_action :users, only: %i[new edit]

  def index
    @groups = Group.search(params[:query])
  end

  def show
    @expenses = @group.expenses
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new group_params
    @group.user_ids = params.require :friends
    current_user.group_ids = params[:id]

    if @group.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @group.update group_params
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @group.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def group_params
    params.require(:group).permit :name, :cover_picture
  end

  def find_group
    @group = Group.find params[:id]
  end

  def users
    @users = User.all
  end
end
