class Upgrade < ActiveRecord::Base
  include FriendlyId
  friendly_id :name, :use => :slugged

  validates :category, presence: true
  validates :name, presence: true, uniqueness: true

  def upgrade_types
    ['Astromech', 'Bomb', 'Cannon', 'Cargo', 'Crew Member', 'Elite Talents', 'Huge Ship Upgrade', 'Imperial Crew', 'Large Ship Upgrade', 'Missile', 'Modification', 'Secondary Weapon', 'System Upgrade', 'Team', 'Title', 'Torpedo', 'Turret']
  end
end
