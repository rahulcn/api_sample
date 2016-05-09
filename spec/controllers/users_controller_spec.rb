require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET index' do
    let(:users) { FactoryGirl.create_list(:user, 5) }

    it 'returns a successful 200 response' do
      get :index, format: :json
      expect(response).to be_success
    end

    it 'returns all the users' do
      get :index, format: :json
      expect(users.length).to eq(5)
    end
  end

  describe 'GET show' do
    let(:user) { FactoryGirl.build_stubbed(:user, id: 1) }
    let(:id) { 1 }

    it 'returns the specified item' do
      expect(user['id']).to eq(id)
    end

    it 'responds with a 200 status' do
      expect(response.status).to eq(200)
    end
  end

  describe 'POST create' do
    let(:valid_params) { {'user' => FactoryGirl.build(:user).attributes } }

    it 'creates a new User' do
      request.accept = 'application/json'
      post :create, valid_params

      expect(response.content_type).to eq('application/json')
      expect(response).to be_success
      expect(response).to have_http_status(:created)
    end
  end

end
