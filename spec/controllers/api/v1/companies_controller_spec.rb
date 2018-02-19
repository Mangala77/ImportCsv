require 'rails_helper'

describe Api::V1::CompaniesController do
  # initialize test data
  let!(:companies) { create_list(:company, 5) }
  before do
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials("secret123")
  end

  # Test suite for GET /todos
  describe 'GET #index' do
    # make HTTP get request before each example
    before { get :index }


    it 'returns companies' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response.code).to eq('200')
    end
  end
end
