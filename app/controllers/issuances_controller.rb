class IssuancesController < ApplicationController
  before_action :find_issuable, only: :create

  def show
    @equipment = Equipment.find(params[:equipment_id]) if params[:equipment_id]
    @access = Access.find(params[:access_id]) if params[:access_id]
    @issuance = Issuance.find(params[:id])
  end
  def index
    @leaves = Leave.all
    @issuances = current_user.issuances
  end
  def create
    @issuance = current_user.issuances.build(issuable: @issuable, description: params[:issuance][:description])
    if @issuance.save
      redirect_to equipment_issuance_path(@issuable.id, @issuance)
    else
      redirect_to :back
    end
  end

  private

  def find_issuable
    @issuable = Equipment.find(params[:equipment][:id]) if params[:equipment] && params[:equipment][:id]
    @issuable = Access.find(params[:access][:id]) if params[:access] && params[:access][:id]
  end
end
