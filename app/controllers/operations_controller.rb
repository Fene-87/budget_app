class OperationsController < ApplicationController
  def index
  end

  def new
    @group = Group.find(params[:group_id])
    @operation = Operation.new
  end

  def create
    @operation = Operation.new(operation_params)
    @operation.author_id = current_user.id
    @operation.groups = Group.where(id: params[:operation][:group_ids]).includes([:user])

    if @operation.save
      flash[:success] = 'Transaction created successfully'
      redirect_to group_operations_path
    else
      flash[:danger] = 'Transaction could not be created'
    end
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount, group_ids: [])
  end
end
