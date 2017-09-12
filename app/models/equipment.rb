class Equipment < ApplicationRecord
  belongs_to :user

  belongs_to :issuer, class_name: "User"

  enum state: [:open, :approved, :rejected, :revoked]

  def issued?
    state.approved?
  end

  def issued_on
    updated_at.strftime("%d-%m-%Y")
  end

  def requested_on
    created_at.strftime("%d-%m-%Y")
  end
end
