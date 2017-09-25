class EquipmentController < ApplicationController
    before_action :authenticate_user!
    before_action :find_access, only: [:show, :edit, :update, :destroy]

    def index
      @accesses = Equipment.all
    end

    def new
      @equipment = Equipment.new
    end

    def create
      @equipment = Equipment.find(params[:equipment][:id])
      if @equipment.save
        @issuance = @equipment.issuances.create(user_id: current_user.id)
        flash[:success]= "Equipment Created Successfully"
        redirect_to equipment_issuance_path(@equipment, @issuance)
      else
        flash[:danger]= "Equipment not created, contains errors"
        render 'new'
      end
    end

    def edit
    end
    def update
      @equipment.update(equipment_params)
      if @equipment.save
        @issuance = @equipment.issuances.create(user_id: current_user.id)
        flash[:success]= "Equipment Created Successfully"
        redirect_to @issuance
      else
        flash[:danger]= @equipment.errors.messages
        render 'new'
      end
    end
    def destroy
      @equipment.destroy
      redirect_to :back
    end

    private

    def find_equipment
      @equipment = Equipment.cached_find(params[:id])
    end

    def equipment_params
      params.require(:equipment).permit(:name, :description, :kind)
    end
end
