class CrossfittersController < ApplicationController
    def index
        @crossfitters = Crossfitter.crossfitters_true
        #  @crossfitters = Crossfitter.all
    end

    def show 
        @crossfitter = Crossfitter.find(params[:id])
    end

    def edit 
        @crossfitter = Crossfitter.find(params[:id])
    end

    def update
        crossfitter = Crossfitter.find(params[:id])
        crossfitter.update(crossfitter_params)
        redirect_to "/crossfitters/#{crossfitter.id}"
    end

    private 

    def crossfitter_params
        params.permit(:name, :oly_lift, :age)
    end
end