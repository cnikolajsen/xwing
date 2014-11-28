class Faction < ActiveRecord::Base
  include FriendlyId
  friendly_id :name, :use => :slugged

  validates :name, presence: true, uniqueness: true

  has_many :faction_ships, dependent: :destroy
  has_many :ships, through: :faction_ships
  has_many :faction_pilots, dependent: :destroy
  has_many :pilots, through: :faction_pilots

  accepts_nested_attributes_for :faction_ships, reject_if: proc { |a| a['ship_id'].blank? }, allow_destroy: true
  accepts_nested_attributes_for :faction_pilots, reject_if: proc { |a| a['pilot_id'].blank? }, allow_destroy: true


  def pilot_names
    pilot_arr = Array.new
    pilots.each do |pilot|
      pilot_arr << ActionController::Base.helpers.link_to(pilot.name, pilot)
    end
    pilot_arr
  end


  def ship_names
    ship_arr = Array.new
    ships.each do |ship|
      ship_arr << ActionController::Base.helpers.link_to(ship.ship_type, ship)
    end
    ship_arr
  end
end
