class UsersController < ApplicationController

    def index
        users = User.all
        if users
            render json: users
        else 
            render json: {
                error: 'no users found'
            }, status: 500
        end
    end

    def show
        user = User.find(params[:id])
        if user
            render json: user
        else
            render json: {
                status: 500,
                errors: ['no users found']
            }
        end
    end

    def create
        user = User.new(user_params)
    end

    private

    def user_params
        params.require(:user).permit(:username, :balance)
    end
end