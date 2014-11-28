class Pilot < ActiveRecord::Base
  include FriendlyId
  friendly_id :name, :use => :slugged

  validates :name, presence: true, uniqueness: true

  has_many :faction_pilots, dependent: :destroy
  has_many :factions, through: :faction_pilots

  accepts_nested_attributes_for :faction_pilots, reject_if: proc { |a| a['faction_id'].blank? }, allow_destroy: true

  def faction_names
    faction_arr = Array.new
    factions.each do |faction|
      faction_arr << ActionController::Base.helpers.link_to(faction.name, faction)
    end
    faction_arr
  end
end
