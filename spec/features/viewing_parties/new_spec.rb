require 'rails_helper'

RSpec.describe 'create viewing party' do
  describe 'happy path' do
    it 'allows user to create a viewing party' do
      VCR.use_cassette('moviedb_movies', re_record_interval: 7.days) do
        visit 
      end
    end
  end
end