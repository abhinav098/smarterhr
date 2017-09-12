class Leave < ApplicationRecord
  belongs_to :user

  enum state: [:approved, :rejected, :open, :revoked]

  validates :message, presence:true
  validates :to_date, presence:true
  validates :from_date, presence:true

  def start_time
    self.from
  end

  def end_time
    self.to
  end

  def correct_leave
    DateTime.parse(to).mjd >= DateTime.parse(from).mjd
  end

  def from
    from_date.strftime("%d-%m-%Y")
  end

  def to
    to_date.strftime("%d-%m-%Y")
  end

  def days
    ((from_date.to_date..to_date.to_date).collect(&:wday) - [0, 6]).count
  end
end
