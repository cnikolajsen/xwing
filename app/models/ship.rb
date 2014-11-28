class Ship < ActiveRecord::Base
  include FriendlyId
  friendly_id :ship_type, :use => :slugged

  validates :ship_type, presence: true, uniqueness: true

  has_many :faction_ships, dependent: :destroy
  has_many :factions, through: :faction_ships

  accepts_nested_attributes_for :faction_ships, reject_if: proc { |a| a['faction_id'].blank? }, allow_destroy: true
end
