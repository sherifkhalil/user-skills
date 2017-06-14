class UsersController < ApplicationController


    def index
        users = User.all_users_with_skills_and_cats
        json_response(users)
    end

    def show
        user = User.user_with_skills_and_cats(params[:id])
        json_response(user)
    end
end
