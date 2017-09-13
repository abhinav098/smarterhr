class LeavesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_leave, only: [:show, :update , :destroy]

	def new
		@leave = Leave.new
	end
	def index
		@leaves = if params[:employee]
								current_user.employees.map(&:leaves).flatten
							else
			 					current_user.leaves
							end
	end

	def create
		@leave = current_user.leaves.new(leave_params)
		if @leave.correct_leave
			@leave.save
			flash[:success] = 'Leave has been successfully requested.'
			redirect_to :leaves
		else
			flash[:error] = 'Leave dates incorrect.'
			render 'new'
		end
	end

	def edit
		@leave = Leave.find(params[:id])
	end

	def update
		if action? :approve
			@leave.approved!
			flash[:alert] = 'Leave request Approved!'
			redirect_to :back
		elsif action? :reject
			@leave.rejected!
			flash[:alert] = 'Leave request Rejected!'
			redirect_to :back
		else
			@leave.update(leave_params)
			flash[:alert] = 'Leave successfully edited !'
			redirect_to :leaves
		end
	end

	def destroy
		@leave.destroy
		redirect_to :leaves, notice: 'Leave was successfully cancelled.'
	end

	private

	def action?(act)
    params['commit'].casecmp(act.to_s.downcase).zero?
  end

	def find_leave
		@leave = Leave.find(params[:id])
	end

	def leave_params
		params.require(:leave).permit(:message, :from_date, :to_date, :status)
	end
end
