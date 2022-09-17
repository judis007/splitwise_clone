class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_group, only: %i[show edit update]

  def index
    @groups = Group.all
  end

  def show
    @expenses = @group.expenses
  end
  
  def new
    @users = User.all
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

  private

  def group_params
    params.require(:group).permit :name
  end

  def find_group
    @group = Group.find params[:id]
  end
end
