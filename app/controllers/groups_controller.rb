class GroupsController < ApplicationController
  load_and_authorize_resource

  include ApplicationHelper

  def index
    @groups = Group.includes(:user, :entities).where({ user_id: current_user.id }).order(created_at: :desc)
  end

  def show
    @group_entities = current_user.groups.includes(:entities).find_by(id: params[:id]).entities.order(created_at: :desc)
  end

  def new
    @group = Group.new
    @icons = Icon.all.order(category: :asc)
  end

  def create
    name = group_params[:name]
    icon = group_params[:icon]
    @group = Group.new(user_id: current_user.id, name: name, icon: icon)

    if @group.save
      redirect_to groups_path
    else
      @icons = Icon.all.order(category: :asc)  # Ensure @icons is initialized for the form re-render
      render :new, status: :unprocessable_entity 
    end
  end

  def destroy
    @group = current_user.groups.includes(:entities).find_by(id: params[:id])

    if @group.destroy
      redirect_to groups_path
    else
      redirect_to groups_path, notice: 'Group could not be deleted.'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
