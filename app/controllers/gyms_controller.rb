class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_message
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_message

    
    #GET to /gyms
    def index 
        render json: Gym.all
    end

    #GET to /gyms/:id
    def show
       render json: find_gym
    end

    #POST to /gyms
    def create
        gym = Gym.create!(gym_params)
        render json: gym, status: :created
    end

    #PATCH to /gyms/:id
    def update
        gym = find_gym
        gym.update!(gym_params)
        render json: gym
    end

    #DELETE to /gyms/:id
    def destroy
        gym = find_gym
        gym.destroy
        head :no_content
    end

    private
    #Find helper functions
    def find_gym
        Gym.find(params[:id])
    end

    def gym_params
        params.permit(:name, :address)
    end

    def render_not_found_message
        render json: {error: "Gym not found"}, status: :not_found
    end

    def render_unprocessable_entity_message(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
