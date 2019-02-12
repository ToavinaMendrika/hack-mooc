class Api::SessionController < Api::ApplicationApi
    def create()
        user = User.find_by email: params[:email]
        if user && user.valid_password?(params[:password])
            token = Auth.issue({user: user.id})
            render json: {success: "ok", token:token}
        else
            render json: {error: "email ou mdp non valide"}
        end
    end

end