class AccessesController < ApplicationController
  def new
    @access = Access.new
  end
  before_action :authenticate_user!
  before_action :find_access, only: [:show, :update, :destroy]

  def new
    @access = Access.new
  end

  def index
    @accesses = if params[:manager]
                current_user.employees.map(&:accesses).flatten
              else
                current_user.accesses.order(created_at: :desc)
              end
  end

  def create
    @access = current_user.accesses.new(access_params)
    @access.issuer = current_user.managers.first
    if @access.save
      flash[:success] = 'Access has been successfully requested.'
      redirect_to :accesses
    else
      render 'new'
      flash[:error] = 'Something Wrong !!'
    end
  end

  def edit
    @access = Access.find(params[:id])
  end

  def update
    if action? :approve
      @access.approved!
      flash[:success] = 'Access request Approved!'
      redirect_to :back
    elsif action? :reject
      @access.rejected!
      flash[:alert] = 'Access request Rejected!'
      redirect_to :back
    else
      @access.update(access_params)
      redirect_to :accesses
    end
  end

  def destroy
    @access.destroy
    redirect_to :back, notice: 'Access request was successfully cancelled.'
  end

  private

  def action?(act)
    params['commit'].casecmp(act.to_s.downcase).zero?
  end

  def find_access
    @access = Access.find(params[:id])
  end

  def access_params
    params.require(:access).permit(:kind)
  end
end
