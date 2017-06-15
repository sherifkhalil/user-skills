require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  # initialize test data 
  let!(:users) { create_list(:user, 10) }
  let!(:skill) { create(:skill) }
  let!(:category) { create(:category) }
  let(:user) { users.first }
  let(:user_id) { user.id }

  before { 
    skill.categories << category
    skill.save
    user.skills << skill
    user.save
 }

  describe 'GET /users' do
    before { get '/users' }

    it 'returns users and their skills and categories' do
      #`json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
      expect(json.first['skills'].first['name']).to eq(skill.name)
      expect(json.first['skills'].first['categories'].first['name']).to eq(category.name)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:id' do
    before { get "/users/#{user_id}" }

    context 'when the record exists' do
      it 'returns the user and its skills and categories' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(user.id)
        expect(json['skills'].first['name']).to eq(skill.name)
        expect(json['skills'].first['categories'].first['name']).to eq(category.name)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:user_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(json['message']).to match(/Couldn't find User/)
      end
    end
  end
end