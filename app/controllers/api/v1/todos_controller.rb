class Api::V1::TodosController < ApiController
	def index
		@todos = Todo.all
		render json: @todos
	end
end