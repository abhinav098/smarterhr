class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper

  def search
    @accesses = Access.ransack(name_cont: params[:q]).result(distinct: true)
    @equipment = Equipment.ransack(name_cont: params[:q]).result(distinct: true)
    respond_to do |format|
      format.html{}
      format.json{
        @accesses = @accesses.limit(5)
        @equipment = @equipment.limit(5)
      }
    end
  end
end
