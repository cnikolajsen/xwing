class Squadron < ActiveRecord::Base
  #include FriendlyId
  #friendly_id :slug_candidates, use: :slugged

  validates :name, presence: true
  validates :faction_id, presence: true
  validates :points, presence: true

  belongs_to :faction
  belongs_to :user

  def slug_candidates
    [
      [:pilot_name, :ship]
    ]
  end

  def match_totals
    wins + losses + draws
  end

  def win_percentage
    wins.to_f / match_totals.to_f * 100.0
  end

  def draw_percentage
    draws.to_f / match_totals.to_f * 100.0
  end

  def loss_percentage
    losses.to_f / match_totals.to_f * 100.0
  end
end
