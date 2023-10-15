class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show edit update destroy]

  def index
    @group = Group.find(params[:group_id])
    @entities = []
    @total_amount = 0
    @group.group_entities.order(created_at: :desc).includes(:entity).each do |group_entity|
      @entities << group_entity.entity
      @total_amount += group_entity.entity.amount
    end
  end

  def new
    @entity = Entity.new
  end

  def create
    @new_entity = current_user.entities.new(entity_params)
    if @new_entity.save
      GroupEntity.create(group_id: params.require(:entity).permit(:group_id)[:group_id], entity_id: @new_entity.id)
      redirect_to group_entities_path(params[:group_id]), flash: { alert: 'Your transaction is well registered.' }
    else
      redirect_to new_group_entity_path, flash: { alert: 'Something went wrong' }
    end
  end

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
