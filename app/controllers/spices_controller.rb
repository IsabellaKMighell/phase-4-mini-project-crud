class SpicesController < ApplicationController
    def index
        spices = Spice.all
        render json: spices, status: :ok
    end

    def show 
        spice = find_by
        if spice
            render json: spice, status: :ok
        else 
            render json: {error: "Spice not found"}, status: :not_found
        end
    end

    def create
        spice = Spice.create(spices_params)
        render json: spice, status: :created
    end

    def update
        spice = find_by
        if spice
            spice.update(spices_params)
            render json: spice, status: :ok
        else 
            render json: {error: "Spice not found"}, status: :not_found
        end
    end

    def destroy
        find_by.destroy
        head :no_content
    end


    private 

    def spices_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_by
        Spice.find_by(id: params[:id])
    end

end
