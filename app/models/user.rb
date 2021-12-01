class User < ApplicationRecord
  has_many :invites
  has_many :parties, dependent: :destroy

  validates_presence_of :name, :email, uniqueness: true
end
