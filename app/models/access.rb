class Access < ApplicationRecord
  has_many :issuances, as: :issuable
  has_many :users, through: :issuances, source: :user
  enum kind: [:tester, :admin, :sales, :developer, :manager, :marketing]

  validates :name, presence:true
  validates :description, presence:true
  validates :url, presence:true

  def self.cached_find(id)
    Rails.cache.fetch(['access', id], expires_in: 5.minutes){ find(id) }
  end

  after_commit :flush_cache

  private
  def flush_cache
    Rails.cache.delete(['access',id])
  end

end
