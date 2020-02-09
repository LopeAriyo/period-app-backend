class UsersController < ApplicationController
    def signin
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            render json: { email:  user.email, token: issue_token({ id: user.id }) }
        else
            render json: {error: "E-mail Address or Password Invalid"}, status: 401
        end
    end

end


