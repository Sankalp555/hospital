require 'rails_helper'

RSpec.describe 'POST /api/users', type: :request do
  let(:url) { '/api/users' }
  let(:params) do
    {
      user: {
        email: 'user@example.com',
        password: 'password',
        first_name: 'test',
        middle_name: 'test'
        last_name: 'test',
        user_type: 'Doctor',
        phone_number: '1212121212',
        organization_id: 2
      }
    }
  end

  context 'when user is unauthenticated' do
    before { post url, params: params }

    it 'returns 200' do
      expect(response.status).to eq 200
    end

    it 'returns a new user' do
      expect(response.body).to match_schema('user')
    end
  end

  context 'when user already exists' do
    before do
      Fabricate :user, email: params[:user][:email]
      post url, params: params
    end

    it 'returns bad request status' do
      expect(response.status).to eq 400
    end

    it 'returns validation errors' do
      expect(json['errors'].first['title']).to eq('Bad Request')
    end
  end
end