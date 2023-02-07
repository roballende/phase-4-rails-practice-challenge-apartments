class LeasesController < ApplicationController
    wrap_parameters format: []
    
    def create
        lease = Lease.create!(lease_params)
        render json: lease, status: :created
    end

    def delete
        lease = Lease.find(params[:id])
        lease.delete
        head :no_content
    end

    private

    def lease_params
        params.permit(:rent)
    end

end
