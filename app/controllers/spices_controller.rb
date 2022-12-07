class SpicesController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :error_response

    def index 
        spice = Spice.all 
        render json: spice 
    end

    def show 
        spice = find_spice 
        render json: spice 
    end

    def create 
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update 
        spice = find_spice
        spice.update(spice_params)
        render json: spice 
    end

    def destroy
        spice = find_spice
        spice.destroy 
        head :no_content
    end

    private 

    def find_spice 
        Spice.find(params[:id])
    end

    def spice_params
        params.permit(:title,:image,:description,:notes,:rating)
    end

    def error_response 
        render json: {error: "No spice has been found."}
    end

end
