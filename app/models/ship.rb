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

end
