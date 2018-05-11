class Api::V1::AccountController < ApiController
	skip_before_action :authenticate_request, :only => [:register]

  def register
    @user = Account.create(user_params)
   if @user.save
    response = { message: 'User created successfully'}
    render json: response, status: :created 
   else
    render json: @user.errors, status: :bad
   end 
  end

  private

  def user_params
    params.permit(
      :email,
      :password
    )
  end
end