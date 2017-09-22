class RegistrationsController < Devise::RegistrationsController

  before_action :find_manager, only: :create
  after_action :associate_manager, only: :create

 private

 def sign_up_params
   params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
 end

 def account_update_params
   params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
 end

 def associate_manager
   return if params[:manager][:manager_id].blank?
   manager = User.find(params[:manager][:manager_id])
   manager.employees << resource
 end

 def find_manager
   if params[:manager][:manager_id].blank?
     flash[:error] = 'Please Choose Your manager'
     return redirect_to :back
   end
 end
end
