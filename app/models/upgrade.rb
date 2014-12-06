class Upgrade < ActiveRecord::Base
  include FriendlyId
  friendly_id :name, :use => :slugged

  validates :category, presence: true
  validates :name, presence: true, uniqueness: true
end
