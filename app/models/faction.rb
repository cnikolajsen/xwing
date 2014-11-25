class Faction < ActiveRecord::Base
  include FriendlyId
  friendly_id :name, :use => :slugged

  validates :name, presence: true, uniqueness: true
end
