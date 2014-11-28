class FactionShip < ActiveRecord::Base
  belongs_to :faction
  belongs_to :ship
end
