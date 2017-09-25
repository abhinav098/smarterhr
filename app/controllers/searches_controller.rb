class SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @search_response = Rails.cache.fetch(params[:q], expires_in: 12.hours) do
      @accesses = Access.ransack(name_cont: params[:q]).result(distinct: true)
    end
      respond_to do |format|
        format.html{}
        format.json{
          @accesses = @accesses.limit(5)
        }
      end
  end

  def new
    @access = Access.new
  end

  def create
    if params[:search]
      @access = Access.create(name: params[:search], description: params[:description])
      @issuance = @access.issuances.create(user_id:current_user.id)
      redirect_to @issuance
    else
      flash[:danger] = @access.errors.messages
      render :new
    end
  end
end
