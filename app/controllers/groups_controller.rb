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
    group = Group.new(user_id: current_user.id, name:, icon:)

    if group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def destroy
    @group = current_user.groups.includes(:entities).find_by(id: params[:id])

    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
