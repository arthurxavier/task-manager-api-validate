require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let!(:user) { create(:user) }
  let(:user_id) { user.id }

  before { host! 'api.taskmanager.dev'}

  describe 'GET /users/:id'do
    before do
      #especifica a versão que o usuario esta usando
      headers = { 'Accept' => 'application/vnd.taskmanager.v1' }
      get "/users/#{user_id}", params: {}, headers: headers 
    end

    context 'when the user exist' do
      it 'returns the user' do      
        #testando que o id voltando no response seja igual do id do user
        user_response = JSON.parse(response.body)
        expect(user_response['id']).to eq(user_id) 
      end

      #Retorna que deu certo
      it 'return status code 200' do
          expect(response).to have_http_status(200)
      end
    end

    context 'when the user does not exist' do
      let(:user_id) { 10000 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end