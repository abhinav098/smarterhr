class IssuancesController < ApplicationController

  def new
    @asset = if params[:access_id]
               Access.find(params[:access_id])
             else
               Equipment.find(params[:equipment_id])
             end
    @issuance = current_user.issuances.find_or_initialize_by(issuable: @asset)
    @issuance.save
    redirect_to @issuance
  end

  def show
    @issuance = Issuance.find(params[:id])
  end
end
