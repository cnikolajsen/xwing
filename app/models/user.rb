class User < ActiveRecord::Base
  include FriendlyId
  friendly_id :username, :use => :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true

  ROLES = %w(admin moderator player banned)
end
