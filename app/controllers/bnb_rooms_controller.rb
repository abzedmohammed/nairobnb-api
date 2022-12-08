class BnbRoomsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :handle_blank_field

    def index
        render json: BnbRoom.all, status: :ok
    end

    def show
        bnb = BnbRoom.find_by(id: session[:bnb_id])

        if bnb
            render json: bnb, status: :ok
        else
            render json: { error: "Ooops something went wrong" }, status: :unprocessable_entity
        end
    end

    def create
        bnb = BnbRoom.create!(bnb_params)
        if bnb.valid?
            render json: bnb, status: :created
        else
            render json: { errors: bnb.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        bnb = BnbRoom.find_by(id: params[:id])
        
        if bnb
            bnb.update(bnb_params)
            render json: bnb, status: :accepted
        else
            render json: {error: "Bnb not found"}
        end
    end

    def destroy
        bnb = BnbRoom.find_by(id: params[:id])
        if bnb
            bnb.destroy
            head :no_content
            # render json: {error: "production not found"}
        else
            render json: {error: "Bnb not found"}
        end
    end
    

    private

    def bnb_params
        params.permit(:name, :address, :bnb_type, :price, :bnb_image, :features, :bed, :size, :wifi, :electronics, :booked, :bnb_user_id)
    end

    def handle_blank_field(invalid)
        render json: {error: invalid.record.errors}, status: :unprocessable_entity
    end
end
