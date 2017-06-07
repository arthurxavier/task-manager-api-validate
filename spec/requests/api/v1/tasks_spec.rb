require 'rails_helper'

RSpec.describe 'Tasks API'do
  let!(:user) { create(:user) }
  let(:headers) do
    {
      'Content-Type' => Mime[:json].to_s,
      'Accept' => 'application/vnd.taskmanager.v1'  #especifica a versão que o usuario esta usando
      'Authorization' => user.auth_token
   }
  end

  describe 'GET /tasks'do
    before do
       #Sempre que criar uma task que nao tem usuario, vincula com um novo usuario qualquer randomico
       create_list(:task, 5, user_id: user.id)
       get '/tasks', params: {}, headers: headers
    end

    it 'returns status code 200'do
       expect(response).to have_http_status(200)
    end

    it 'returns 5 tasks from database' do 
      expect(json_body[:tasks].count).to eq(5)
    end
   
  end
end