class Api::V1::TodosController < ApiController
	#before_action :authenticate_request!

	def index
		@todos = Todo.all
		render json: @todos
	end
end