class Api::V1::AuthenticationController < ApiController
  #require './lib/json_web_token'
  skip_before_action :authenticate_request, :only => [:authenticate_user]

  def authenticate_user
    logger.info "authenticated_user entro"
    # user = Account.find_for_database_authentication(email: params[:email])
    # if user.valid_password?(params[:password])
    #   render json: payload(user)
    # else
    #   render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    # end

    command = AuthenticateAccount.call(params[:email], params[:password])
    if command.success? 
      #return intial data after signup
      render json: { 
        jwt_token: command.result, 
        #user_id: JsonWebToken.decode(command.result)[:user_id],
        #expiration: JsonWebToken.decode(command.result)[:exp],
        } 
    else 
      render json: { error: command.errors }, status: :unauthorized 
    end
  end

  private

  def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end
end