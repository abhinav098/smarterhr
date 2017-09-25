class AccessesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_access, only: [:show, :edit, :update, :destroy]

  def index
    @accesses = Access.all
  end

  def new
    @access = Access.new
  end

  def create
    @access = Access.create(access_params)
    if @access.save
      @issuance = @access.issuances.create(user_id: current_user.id)
      flash[:success]= "Access Created Successfully"
      redirect_to access_issuance_path(@access, @issuance)
    else
      flash[:danger]= "Access not created, contains errors"
      render 'new'
    end
  end

  def edit
  end
  def update
    @access.update(access_params)
    if @access.save
      @issuance = @access.issuances.create(user_id: current_user.id)
      flash[:success]= "Access Created Successfully"
      redirect_to @issuance
    else
      flash[:danger]= @access.errors.messages
      render 'new'
    end
  end
  def destroy
    @access.destroy
    redirect_to :back
  end

  private

  def find_access
    @access = Access.cached_find(params[:id])
  end

  def access_params
    params.require(:access).permit(:name, :url, :description, :kind)
  end

end
