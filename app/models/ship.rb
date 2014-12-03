class Ship < ActiveRecord::Base
  include FriendlyId
  friendly_id :slug_candidates, use: :slugged

  validates :ship, presence: true
  validates :faction_id, presence: true
  validates :pilot_name, presence: true, uniqueness: true

  belongs_to :faction

  def slug_candidates
    [
      [:pilot_name, :ship]
    ]
  end

  def ship_types
    ['A-Wing', 'B-Wing', 'E-Wing', 'X-Wing', 'Y-Wing', 'Z-95 Headhunter', 'HWK-290', 'TIE Fighter', 'TIE Advanced', 'TIE Bomber', 'TIE Defender', 'TIE Intercepter', 'TIE Phantom', 'Lambda-Class Shuttle', 'VT-49 Decimator', 'Firespray-31', 'StarViper', 'M3-A "Scyk" Interceptor', 'Agressor']
  end
end
