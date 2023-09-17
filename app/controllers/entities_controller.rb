class EntitiesController < ApplicationController
  load_and_authorize_resource

  def new
    @entity = Entity.new
    @groups = current_user.groups.includes(:entities).order(name: :asc)
  end

  def create
    name = entity_params[:name]
    amount = entity_params[:amount]
    @entity = Entity.new(author_id: current_user.id, name:, amount:)
    @entity.groups << current_user.groups.includes(:entities).where(id: entity_params[:group_ids])

    if @entity.save
      redirect_to group_path(entity_params[:group_ids])
    else
      redirect_to new_group_entity_path(params[:group_ids]), notice: 'Transaction could not be created'
    end
  end

  def destroy
    @entity = current_user.entities.includes(:groups).find_by(id: params[:id])

    redirect_to group_path(params[:id])
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_ids)
  end
end
