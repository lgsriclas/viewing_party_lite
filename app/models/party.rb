class Party < ApplicationRecord
  belongs_to :user
  has_many :invites

  validates_presence_of :movie_id, :user_id, :movie_title, :start_time, :start_date, :duration
end
