class BnbUsersController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :handle_blank_field

    def index
        render json: BnbUser.all, status: :ok
    end

    def login
        user = BnbUser.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            render json: user, status: :ok
        else
            render json: {error: "Invalid username or password"}
        end
    end

    def show
        user = BnbUser.find_by(id: params[:user_id])

        if user
            render json: user, status: :ok
        else
            render json: { error: "Not authorized" }, status: :unauthorized
        end
    end

    def create
        user = BnbUser.create!(user_params)
        if user.valid?
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        user = BnbUser.find_by(id: params[:id])
        
        if user
            user.update(user_params)
            render json: user, status: :accepted
        else
            render json: {error: "user not found"}
        end
    end

    def destroy
        user = BnbUser.find_by(id: params[:id])
        if user
            user.destroy
            head :no_content
            # render json: {error: "production not found"}
        else
            render json: {error: "User not found"}
        end
    end
    

    private

    def user_params
        params.permit(:username, :avatar, :password, :full_name, :email, :account_type)
    end

    def handle_blank_field(invalid)
        render json: {error: invalid.record.errors}, status: :unprocessable_entity
    end
end
