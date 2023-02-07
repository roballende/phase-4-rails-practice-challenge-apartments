class ApartmentsController < ApplicationController
    wrap_parameters format: []

    def index
        render json: Apartment.all, status: :ok
    end

    def show
        apartment = Apartment.find(params[:id])
        render json: apartment, status: :ok
    end

    def create
        apartment = Apartment.create!(apartment_params)
        render json: apartment, status: :created
    end

    def update
        apartment = Apartment.find(params[:id])
        apartment.update!(apartment_params)
        render json: apartment, status: :accepted
    end

    def destroy
        apartment = Apartment.find(params[:id])
        apartment.delete
        head :no_content
    end


    private

    def apartment_params
        params.permit(:number)
    end

end
