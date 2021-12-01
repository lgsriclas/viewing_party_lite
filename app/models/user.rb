class User < ApplicationRecord
  has_many :invites
  has_many :parties, dependent: :destroy

  validates_presence_of :name, :email
  validates :email, uniqueness: true 

  def invitations
    invites.joins(:party).select('invites.user_id as invitee_id, parties.*')
  end 
end
