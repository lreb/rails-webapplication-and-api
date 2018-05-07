json.extract! todo, :id, :name, :quantity, :deleted, :created_at, :updated_at
json.url todo_url(todo, format: :json)
