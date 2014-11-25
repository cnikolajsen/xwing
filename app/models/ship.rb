class Ship < ActiveRecord::Base
  include FriendlyId
  friendly_id :ship_type, :use => :slugged

  validates :ship_type, presence: true, uniqueness: true
end
