class User < ApplicationRecord
  has_many :events
  has_many :recurring_events
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :fullname, presence: true, length: { maximum: 50 }
end
