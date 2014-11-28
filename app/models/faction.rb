class Faction < ActiveRecord::Base
  include FriendlyId
  friendly_id :name, :use => :slugged

  validates :name, presence: true, uniqueness: true

  #has_many :faction_ships, dependent: :destroy
  has_many :ships #, through: :faction_ships

  #accepts_nested_attributes_for :faction_ships, reject_if: proc { |a| a['ship_id'].blank? }, allow_destroy: true
  #accepts_nested_attributes_for :faction_pilots, reject_if: proc { |a| a['pilot_id'].blank? }, allow_destroy: true

  def ship_names
    ActionView::Base.send(:include, Rails.application.routes.url_helpers)
    ship_arr = Array.new
    ships.each do |ship|
      ship_arr << ActionController::Base.helpers.link_to("#{ship.ship} - #{ship.pilot_name}", ship)
    end
    ship_arr
  end
end
