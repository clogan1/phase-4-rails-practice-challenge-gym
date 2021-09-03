class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_message
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_message

    
    #GET to /clients
    def index 
        render json: Client.all
    end

    #GET to /clients/:id
    def show
       render json: find_client
    end

    #POST to /clients
    def create
        client = Client.create!(client_params)
        render json: client, status: :created
    end

    #PATCH to /clients/:id
    def update
        client = find_client
        client.update!(client_params)
        render json: client
    end

    private

    def find_client
        Client.find(params[:id])
    end

    def client_params
        params.permit(:name, :age)
    end

    def render_not_found_message
        render json: {error: "Client not found"}, status: :not_found
    end

    def render_unprocessable_entity_message(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
