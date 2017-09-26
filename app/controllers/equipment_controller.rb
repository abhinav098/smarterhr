class EquipmentController < ApplicationController
    before_action :authenticate_user!
    before_action :find_equipment, only: [:show, :edit, :update, :destroy]

    def index
      @equipment = Equipment.all
    end

    def new
      @equipment = Equipment.new
    end

    def create
      @equipment = Equipment.create(equipment_params)
      if @equipment.save
        flash[:success]= "Equipment Created Successfully"
        redirect_to @equipment
      else
        flash[:danger]= "Equipment not created, contains errors"
        render 'new'
      end
    end

    def edit
      @equipment = Equipment.find(params[:id])
    end

    def update
      @equipment.update(equipment_params)
      if @equipment.save
        flash[:success]= "Equipment updated Successfully"
        redirect_to @equipment
      else
        flash[:danger]= "Equipment not updated"
        render 'new'
      end
    end

    def destroy
      @equipment.destroy
      redirect_to equipment_index_path
      flash[:danger]= "Equipment Deleted"

    end

    private

    def find_equipment
      @equipment = Equipment.find(params[:id])
    end

    def equipment_params
      params.require(:equipment).permit(:name, :description, :kind)
    end
end
