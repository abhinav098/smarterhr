class IssuancesController < ApplicationController
  before_action :find_issuable, only: :create

  def show
    @equipment = Equipment.find(params[:equipment_id]) if params[:equipment_id]
    @access = Access.find(params[:access_id]) if params[:access_id]
    @issuance = Issuance.find(params[:id])
  end
  def index
    @leaves = if params[:manager]
                current_user.employees.map(&:leaves).flatten
              else
                current_user.leaves.order(created_at: :desc)
              end
    @issuances = if params[:manager]
                  current_user.employees.map(&:issuances).flatten
                 else
                  current_user.issuances.order(created_at: :desc)
                 end
  end

  def create
    @issuance = current_user.issuances.build(issuable: @issuable, description: params[:issuance][:description])
    if @issuance.save
      redirect_to equipment_issuance_path(@issuable.id, @issuance)
      flash[:success] = "Request created successfully"
    else
      redirect_to :back
      flash[:alert] = "Request not Created"
    end
  end

  def edit
    @issuance = Issuance.find(params[:id])
  end

  def update
    @issuance = Issuance.find(params[:id])
		if action? :approve
			@issuance.approved!
			flash[:alert] = 'Issuance request Approved!'
      @issuance.update_attributes(issuer_id: current_user.id)
			redirect_to :back
		elsif action? :reject
			@issuance.rejected!
      @issuance.update_attributes(issuer_id: current_user.id)
			flash[:alert] = 'Issuance request Rejected!'
			redirect_to :back
		else
			@issuance.update(leave_params)
			flash[:alert] = 'Issuance successfully edited !'
      redirect_to :back
		end
    flash[:alert] = 'Issuance successfully edited !'
	end

  def destroy
    @issuance = Issuance.find(params[:id])
    @issuance.destroy
    redirect_to :back
  end

  private

  def find_issuable
    unless params[:equipment][:id].empty?
      @issuable = Equipment.find(params[:equipment][:id]) if params[:equipment] && params[:equipment][:id]
    end
    @issuable = Access.find(params[:access][:id]) if params[:access] && params[:access][:id]
  end

  def action?(act)
    params['commit'].casecmp(act.to_s.downcase).zero?
  end

end
