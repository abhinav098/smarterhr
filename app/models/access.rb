class Access < ApplicationRecord
  has_many :issuances, as: :issuable
  has_many :users, through: :issuances, source: :user

  enum kind: [:tester, :admin, :sales, :developers, :managers]
end
