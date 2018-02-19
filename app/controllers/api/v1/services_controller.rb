 # app/controllers/api/v1/companies_controller.rb

module Api::V1
  class ServicesController < ApplicationController
    before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  # GET /services.json
    def index
      @services = Service.order(created_at: :desc)
      json_response(@services)
    end

    # GET /services/1
    # GET /services/1.json
    def show
      json_response(@service)
    end

    # GET /services/new
    def new
      @service = Service.new
    end

    # GET /services/1/edit
    def edit
    end

    # POST /services
    # POST /services.json
    def create
      @service = Service.new(service_params)
      @service.save!
      json_response(@service, :created)
    end

    # PATCH/PUT /services/1
    # PATCH/PUT /services/1.json
    def update
      @service.update!(service_params)
      json_response(@service, :updated)
      #end
    end

    # DELETE /services/1
    # DELETE /services/1.json
    def destroy
      @service.destroy
      head :no_content
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.fetch(:service, {}).permit(:name, :price, :duration, :disabled, :company_id)
    end
  end
end
