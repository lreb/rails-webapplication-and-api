class ApiController < ActionController::API
  before_action :authenticate_request
  #before_action :authenticate_request!
  attr_reader :current_user

  private 
	
	def authenticate_request 
		@current_account = AuthorizeApiRequest.call(request.headers).result 
		render json: { error: 'Not Authorized' }, status: 401 unless @current_account 
	end
  #protected
  # def authenticate_request!
  #   unless user_id_in_token?
  #     render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  #     return
  #   end
  #   @current_user = Account.find(auth_token[:user_id])
  # rescue JWT::VerificationError, JWT::DecodeError
  #   render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  # end

  # private
  # def http_token
  #     @http_token ||= if request.headers['Authorization'].present?
  #       request.headers['Authorization'].split(' ').last
  #     end
  # end

  # def auth_token
  #   @auth_token ||= JsonWebToken.decode(http_token)
  # end

  # def user_id_in_token?
  #   http_token && auth_token && auth_token[:user_id].to_i
  # end
end