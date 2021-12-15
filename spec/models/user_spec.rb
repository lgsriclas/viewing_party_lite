require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:parties).dependent(:destroy) }
    it { should have_many :invites }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email) }
    # it { should validate_presence_of(:password_digest) }
    it { should have_secure_password }

    it 'passwords' do
      user = User.create!(name: "Linus van Pelt", email: "Linus@peanuts.com", password: "blankie432", password_confirmation: "blankie432")

      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq("woodstock432")
    end
  end

  describe 'instance methods' do
    let!(:user_1) { create(:user, name: "Peppermint Patty", email: "Patty@peanuts.com", password: "ilovecb123", password_confirmation: "ilovecb123") }
    let!(:user_2) { create(:user, name: "Schroeder", email: "Schroeder@peanuts.com", password: "beethoven555", password_confirmation: "beethoven555") }
    let!(:party_1) { create(:party, user_id: user_1.id, movie_id: 1) }
    let!(:party_2) { create(:party, user_id: user_1.id, movie_id: 2) }
    let!(:party_3) { create(:party, user_id: user_2.id, movie_id: 3) }
    let!(:invite) { Invite.create!(user_id: user_1.id, party_id: party_3.id) }

    describe '#invitations' do
      it 'returns all party invites for a user' do
        expected = {"id"=>party_3.id,
          "user_id"=>user_2.id,
          "created_at"=>party_3.created_at,
          "updated_at"=>party_3.updated_at,
          "invitee_id"=>user_1.id,
          "movie_id"=>3,
          "movie_title"=>party_3.movie_title,
          "start_time"=>party_3.start_time,
          "start_date"=>party_3.start_date,
          "duration"=>party_3.duration,
          "image"=>party_3.image
        }

        expect(user_1.invitations[0].attributes).to eq(expected)
      end
    end
  end
end
