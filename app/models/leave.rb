class Leave < ApplicationRecord
  belongs_to :user
 	after_initialize :default_values

  STATES = %w[open approved rejected cancelled].freeze

  validates :status, inclusion: STATES
  validates :message, presence:true
  validates :to_date, presence:true
  validates :from_date, presence:true

  def from
  	from_date.strftime("%d-%m-%Y")
  end

  def to
  	to_date.strftime("%d-%m-%Y")
  end

  def days
  	(DateTime.parse(to).mjd - DateTime.parse(from).mjd) + 1
  end

  def approve
  	update(status: 'approved')
  end

	def reject
  	update(status: 'rejected')
  end

	def cancel
  	update(status: 'cancelled')
  end

  private
  
    def default_values
      self.status ||= "open"
    end



end
