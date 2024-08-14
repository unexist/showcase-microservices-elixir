app-create:
	mix phx.new todo-service-phoenix --no-html \
		--no-webpack --binary-id --app todo_service_elixir

schema-create:
	mix phx.gen.context Admin Todo todos \
		name:string description:string

migrate:
	mix ecto.migrate

scaffold:
	mix phx.gen.json Admin Todo todos \
		name:string description --no-context --no-schema

db-create:
	mix ecto.create

db-drop:
	mix ecto.drop

run:
	mix phx.server