class Api::V1::TodosController < BaseController
	def index
		@todos = Todo.all
		render json: @todos
	end
end