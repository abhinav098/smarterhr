class Equipment < ApplicationRecord
  has_many :issuances, as: :issuable
  has_many :users, through: :issuances, source: :user

  enum kind: [:electronics, :stationary ]
end
