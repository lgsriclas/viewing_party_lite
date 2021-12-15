class User < ApplicationRecord
  has_many :invites
  has_many :parties, dependent: :destroy

  validates_presence_of :name
  validates_uniqueness_of :email

  has_secure_password

  def invitations
    invites.joins(:party).select('invites.user_id as invitee_id, parties.*')
  end
end
