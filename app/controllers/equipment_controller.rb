class EquipmentController < ApplicationController
  before_action :authenticate_user!
  # before_action :find_equipment, only: [:show, :edit, :update , :destroy]

  def new
    @equipment = Equipment.new
  end
  def index
    @equipments = if params[:manager]
                current_user.employees.map(&:equipment).flatten
              else
                current_user.equipment.order(created_at: :desc)
              end
  end

  def create
    @equipment = current_user.equipment.new(equipment_params)
    # @equipment.issuances.create(user_id: current_user.id, issuer_id: current_user.managers.first.id)
    if @equipment.save
      flash[:success] = "Equipment successfully requested."
    else
      render 'new'
      flash[:success] = "Equipment request process had some errors"
    end
  end

  def update
    if action? :approve
      @equipment.approved!
      flash[:alert] = 'equipment request Approved!'
      redirect_to :equipment_index_path
    elsif action? :reject
      @equipment.rejected!
      flash[:alert] = 'equipment request Rejected!'
      redirect_to :equipment_index_path
    else
      @equipment.update(equipment_params)
      flash[:alert] = 'Equipment request successfully edited !'
      redirect_to :equipment_index_path
    end
  end

  def destroy
    @equipment.destroy
    redirect_to :equipment_index_path, notice: 'Leave was successfully cancelled.'
  end

  private

  def action?(act)
    params['commit'].casecmp(act.to_s.downcase).zero?
  end

  def find_equipment
    @equipment = Equipment.find(params[:id])
  end

  def equipment_params
    params.require(:equipment).permit(:name, :description, :state, :kind)
  end
end
