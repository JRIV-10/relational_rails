class GymCrossfittersController < ApplicationController
    def index 
        if params[:sort] == "name" 
            @gym = Gym.find(params[:gym_id])
            @crossfitters = @gym.ordered_alphabetical
        else 
            @gym = Gym.find(params[:gym_id])
            @crossfitters = @gym.crossfitters    
        end
    end

    def new 
        @gym = Gym.find(params[:gym_id])
    end

    def create 
        @gym = Gym.find(params[:gym_id])
        @gym.crossfitters.create(gym_crossfitter_params)
        redirect_to "/gyms/#{@gym.id}/crossfitters"
    end

    private

    def gym_crossfitter_params
        params.permit(:name, :oly_lift, :age)
    end
end