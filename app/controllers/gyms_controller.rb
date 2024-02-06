class GymsController < ApplicationController 
    def index
        @gyms = Gym.all 
    end

    def show 
        @gym = Gym.find(params[:id])
    end

    def new; end

    def create 
        Gym.create(gym_params)
        redirect_to "/gyms"
    end

    def edit
        @gym = Gym.find(params[:id])
    end

    def update
        gym = Gym.find(params[:id])
        gym.update(gym_params)
        redirect_to "/gyms/#{gym.id}"
    end

    # def destroy 
    #     @gym = Gym.find(params[:id])
    #     @gym.destory
    #     redirect_to "/gyms"
    # end
    
    private 

    def gym_params
    params.permit(:name, :always_open, :num_of_platforms)
    end

end