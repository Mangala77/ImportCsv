 # app/controllers/api/v1/companies_controller.rb

module Api::V1
  class CompaniesController < ApplicationController
    # Generic API stuff here
    # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
    render json: @companies
  end
  end
end

