class Issuance < ApplicationRecord

  belongs_to :issuer, class_name: 'User'
  belongs_to :issuable, polymorphic: true
  belongs_to :user

  enum state: [:open, :approved, :rejected, :revoked]
end