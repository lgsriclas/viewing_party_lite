require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'relationships' do 
    it { should belong_to :user }
    it { should have_many :invites }
  end 

  describe 'validations' do 
    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:movie_title) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:duration) }
  end 
end
