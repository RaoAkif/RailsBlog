require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should render correct text in template' do
      get users_path
      expect(response.body).to include('This is the list of all users')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get user_path(1)
      expect(response).to have_http_status(:success)
    end

    it 'should render show template' do
      get user_path(1)
      expect(response).to render_template(:show)
    end

    it 'should render correct text in template' do
      get user_path(1)
      expect(response.body).to include('This is details of a Specific User with unique index')
    end
  end
end
