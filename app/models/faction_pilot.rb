class FactionPilot < ActiveRecord::Base
  belongs_to :faction
  belongs_to :pilot
end
