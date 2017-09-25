class SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @accesses = Access.ransack(name_cont: params[:q]).result(distinct: true)
    # @equipment = Equipment.ransack(name_cont: params[:q]).result(distinct: true)
    respond_to do |format|
      format.html{}
      format.json{
        @accesses = @accesses.limit(5)
        # @equipment = @equipment.limit(5)
      }
    end
  end

  def new
    @access = Access.new
  end

  def create
    if params[:search]
      # debugger
      @access = Access.create(name: params[:search])
      @issuance = @access.issuances.create(user_id:current_user.id)
      redirect_to @issuance
    else
      render :new
    end
  end
end
