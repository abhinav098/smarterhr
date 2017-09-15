class EquipmentController < ApplicationController
  before_action :authenticate_user!
  before_action :find_equipment, only: [:show, :update , :destroy]

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
    @equipment.issuer = current_user.managers.first
    if @equipment.save
      flash[:success] = 'Equipment has been successfully requested.'
      redirect_to equipment_index_path
    else
      render 'new'
      flash[:error] = 'Something Wrong !!'
    end
  end

  def edit
    @equipment = Equipment.find(params[:id])
  end

  def update
    if action? :approve
      @equipment.approved!
      flash[:success] = 'Equipment request Approved!'
      redirect_to :back
    elsif action? :reject
      @equipment.rejected!
      flash[:alert] = 'Equipment request Rejected!'
      redirect_to :back
    else
      @equipment.update(equipment_params)
      redirect_to equipment_index_path
    end
  end

  def destroy
    @equipment.destroy
    redirect_to :back, notice: 'equipment was successfully cancelled.'
  end

  private

  def action?(act)
    params['commit'].casecmp(act.to_s.downcase).zero?
  end

  def find_equipment
    @equipment = Equipment.find(params[:id])
  end

  def equipment_params
    params.require(:equipment).permit(:name)
  end
end
