app-create:
	mix phx.new todo-service-phoenix --no-html --no-webpack --binary-id --app todo_service_elixir

db-create:
	mix ecto.create

db-drop:
	mix ecto.drop
