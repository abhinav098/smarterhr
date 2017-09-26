class Equipment < ApplicationRecord
  has_many :issuances, as: :issuable
  has_many :users, through: :issuances, source: :user

  validates :name, presence:true
  validates :description, presence:true
  
  enum kind: [:electronics, :stationary ]
end
