class LeavesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_leave, only: [:show, :update , :destroy]

	def new
		@leave = Leave.new
	end
	def index
		@leaves = []
		if current_user.manager?
			@leaves <<  current_user.employees.map(&:leaves)
		else
			@leaves << current_user.leaves.order(:created_at).to_a if current_user.leaves.any?
		end
		@leaves = @leaves.flatten
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
			redirect_to :leaves
		elsif action? :reject
			@leave.rejected!
			redirect_to :leaves
		else
			@leave.update(leave_params)
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
