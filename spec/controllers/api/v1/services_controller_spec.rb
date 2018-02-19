require 'rails_helper'

describe Api::V1::ServicesController do
  # initialize test data 
  let!(:company) { create(:company) }
  let!(:services) { create_list(:service, 5, company_id: company.id) }
  let(:service_id) { services.first.id }
  before do
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials("secret123")
  end

  # Test suite for GET /todos
  describe 'GET #index' do
    # make HTTP get request before each example
    before { get :index }


    it 'returns services' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response.code).to eq('200')
    end
  end

  # Test suite for GET /services/:id
  describe 'GET #show' do
    before { get :show,  params: { id: service_id.to_i } }

    context 'when the record exists' do
      it 'returns the services' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(service_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status('200')
      end
    end

    context 'when the record does not exist' do
      let(:service_id) { 100.to_i }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
       expect(response.body).to eq("not_found")
      end
    end
  end

  # Test suite for POST /services
  describe 'POST #create' do
    # valid payload
    let(:f_company) { create(:company) }
    
    context 'when the request is valid' do
      before { post :create, params: { "service" => { name: 'Design with HTML/CSS', price:120, duration:30, disabled: false, company_id: f_company.id} } }

      it 'creates a service' do
        expect(json['name']).to eq('Design with HTML/CSS')
        expect(json['price']).to eq(120)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post :create, params: { duration: 120} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Company must exist, Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /services/:id
  describe 'PUT #update' do
    #let(:valid_attributes) { { name: 'Restful API design' } }

    context 'when the record exists' do
      before { put :update, params: { id: service_id.to_i, service: {name: 'Restful API design'} } }

      it 'updates the record' do
        expect(json["name"]).to eq('Restful API design')
      end
      
    end
  end

  # Test suite for DELETE /services/:id
  describe 'DELETE #destroy' do
    context 'when record exist' do
      before { delete :destroy, params: {id: service_id.to_i} }

      it 'returns status code 204' do
        expect(response).to have_http_status('204')
      end
    end
    
    context 'when record doesnt exist' do
      before { delete :destroy, params: {id: 100} }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
