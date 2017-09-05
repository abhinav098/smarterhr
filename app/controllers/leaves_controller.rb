class LeavesController < ApplicationController
	before_action :authenticate_user! 
	before_action :find_leave, only: [:show, :update , :destroy]

	def new
		@leave = Leave.new
	end

	def index
		@leaves = current_user.leaves
	end

	def create
		@leave = current_user.leaves.create(leave_params)
			redirect_to @leave , notice: 'Leave has been successfully requested.'
	end

	def edit
		@leave = Leave.find(params[:id])
	end
	
	def update
		if @leave.update(leave_params)
			redirect_to @leave
		else
			render 'new'
      render @leave.errors
		end
	end

	def destroy
		@leave.destroy
		redirect_to @leave, notice: 'Leave was successfully cancelled.'
	end

	private 

	def find_leave
		@leave = Leave.find(params[:id])
	end

	def leave_params
		params.require(:leave).permit(:message, :from_date, :to_date, :status)
	end
end
