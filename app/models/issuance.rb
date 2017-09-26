class Issuance < ApplicationRecord
  belongs_to :issuer, class_name: 'User', required: false
  belongs_to :issuable, polymorphic: true
  belongs_to :user

  validates :description, presence: true

  enum state: [:open, :approved, :rejected, :revoked]
end
