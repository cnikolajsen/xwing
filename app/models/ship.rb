class Ship < ActiveRecord::Base
  include FriendlyId
  friendly_id :ship, :use => :slugged

  validates :ship, presence: true
  validates :faction_id, presence: true
  validates :pilot_name, presence: true, uniqueness: true

  #has_many :faction_ships, dependent: :destroy
  #has_many :factions, through: :faction_ships
  belongs_to :faction

  #accepts_nested_attributes_for :faction_ships, reject_if: proc { |a| a['faction_id'].blank? }, allow_destroy: true
end
