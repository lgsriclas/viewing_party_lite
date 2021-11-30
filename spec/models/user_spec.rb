require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do 
    it { should have_many(:parties).dependent(:destroy) }
    it { should have_many :invites }
  end 

  describe 'validations' do 
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end 
end
