class Expansion < ActiveRecord::Base
  include FriendlyId
  friendly_id :title, :use => :slugged

  validates :title, presence: true, uniqueness: true
end
