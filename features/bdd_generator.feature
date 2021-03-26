Feature: bdd_generator

	Scenario: contacts create
		Given There is an instance of Contact with id 1 and params: {"id":1,"name":"caderno","email":"30","created_at":"2021-03-26T22:42:13.214Z","updated_at":"2021-03-26T22:42:13.214Z"}
		When the client requests with POST /contacts, body: {"contact":{"name":"caderno","email":"30"},"controller":"contacts","action":"create"}, headers: {}
		Then the response status should be 422
		And The JSON response should be {"email":["has already been taken","is invalid"]}

	Scenario: contacts create
		Given There is an instance of Contact with id 1 and params: {"id":1,"name":"caderno","email":"30","created_at":"2021-03-26T22:42:13.214Z","updated_at":"2021-03-26T22:42:13.214Z"}
		When the client requests with POST /contacts, body: {"contact":{"name":"caderno","email":"oi@dedd.com"},"controller":"contacts","action":"create"}, headers: {}
		Then the response status should be 201
		And The JSON response should be {"id":2,"name":"caderno","email":"oi@dedd.com","created_at":"2021-03-26T22:50:04.084Z","updated_at":"2021-03-26T22:50:04.084Z"}

	Scenario: contacts create
		Given There is an instance of Contact with id 1 and params: {"id":1,"name":"caderno","email":"30","created_at":"2021-03-26T22:42:13.214Z","updated_at":"2021-03-26T22:42:13.214Z"}
		Given There is an instance of Contact with id 2 and params: {"id":2,"name":"caderno","email":"oi@dedd.com","created_at":"2021-03-26T22:50:04.084Z","updated_at":"2021-03-26T22:50:04.084Z"}
		When the client requests with POST /contacts, body: {"contact":{"name":"","email":"oi@dedd.com"},"controller":"contacts","action":"create"}, headers: {}
		Then the response status should be 422
		And The JSON response should be {"email":["has already been taken"],"name":["can't be blank"]}

	Scenario: contacts create
		Given There is an instance of Contact with id 1 and params: {"id":1,"name":"caderno","email":"30","created_at":"2021-03-26T22:42:13.214Z","updated_at":"2021-03-26T22:42:13.214Z"}
		Given There is an instance of Contact with id 2 and params: {"id":2,"name":"caderno","email":"oi@dedd.com","created_at":"2021-03-26T22:50:04.084Z","updated_at":"2021-03-26T22:50:04.084Z"}
		When the client requests with POST /contacts, body: {"contact":{"name":"iio","email":"oi@dedd.com"},"controller":"contacts","action":"create"}, headers: {}
		Then the response status should be 422
		And The JSON response should be {"email":["has already been taken"]}

	Scenario: contacts index
		Given There is an instance of Contact with id 1 and params: {"id":1,"name":"caderno","email":"30","created_at":"2021-03-26T22:42:13.214Z","updated_at":"2021-03-26T22:42:13.214Z"}
		Given There is an instance of Contact with id 2 and params: {"id":2,"name":"caderno","email":"oi@dedd.com","created_at":"2021-03-26T22:50:04.084Z","updated_at":"2021-03-26T22:50:04.084Z"}
		When the client requests with GET /contacts, body: {"controller":"contacts","action":"index"}, headers: {}
		Then the response status should be 200
		And The JSON response should be [{"id":1,"name":"caderno","email":"30","created_at":"2021-03-26T22:42:13.214Z","updated_at":"2021-03-26T22:42:13.214Z"},{"id":2,"name":"caderno","email":"oi@dedd.com","created_at":"2021-03-26T22:50:04.084Z","updated_at":"2021-03-26T22:50:04.084Z"}]

	Scenario: contacts show
		Given There is an instance of Contact with id 1 and params: {"id":1,"name":"caderno","email":"30","created_at":"2021-03-26T22:42:13.214Z","updated_at":"2021-03-26T22:42:13.214Z"}
		Given There is an instance of Contact with id 2 and params: {"id":2,"name":"caderno","email":"oi@dedd.com","created_at":"2021-03-26T22:50:04.084Z","updated_at":"2021-03-26T22:50:04.084Z"}
		When the client requests with GET /contacts/1, body: {"controller":"contacts","action":"show","id":"1"}, headers: {"Authorization":"dedeed"}
		Then the response status should be 200
		And The JSON response should be {"id":1,"name":"caderno","email":"30","created_at":"2021-03-26T22:42:13.214Z","updated_at":"2021-03-26T22:42:13.214Z"}

	Scenario: contacts update
		Given There is an instance of Contact with id 1 and params: {"id":1,"name":"caderno","email":"30","created_at":"2021-03-26T22:42:13.214Z","updated_at":"2021-03-26T22:42:13.214Z"}
		Given There is an instance of Contact with id 2 and params: {"id":2,"name":"caderno","email":"oi@dedd.com","created_at":"2021-03-26T22:50:04.084Z","updated_at":"2021-03-26T22:50:04.084Z"}
		When the client requests with PATCH /contacts/1, body: {"contact":{"name":"clarita caneca"},"controller":"contacts","action":"update","id":"1"}, headers: {}
		Then the response status should be 422
		And The JSON response should be {"email":["is invalid"]}

	Scenario: contacts update
		Given There is an instance of Contact with id 1 and params: {"id":1,"name":"caderno","email":"30","created_at":"2021-03-26T22:42:13.214Z","updated_at":"2021-03-26T22:42:13.214Z"}
		Given There is an instance of Contact with id 2 and params: {"id":2,"name":"caderno","email":"oi@dedd.com","created_at":"2021-03-26T22:50:04.084Z","updated_at":"2021-03-26T22:50:04.084Z"}
		When the client requests with PATCH /contacts/2, body: {"contact":{"name":"clarita caneca"},"controller":"contacts","action":"update","id":"2"}, headers: {}
		Then the response status should be 200
		And The JSON response should be {"id":2,"name":"clarita caneca","email":"oi@dedd.com","created_at":"2021-03-26T22:50:04.084Z","updated_at":"2021-03-26T22:50:49.328Z"}

	Scenario: contacts update
		Given There is an instance of Contact with id 1 and params: {"id":1,"name":"caderno","email":"30","created_at":"2021-03-26T22:42:13.214Z","updated_at":"2021-03-26T22:42:13.214Z"}
		Given There is an instance of Contact with id 2 and params: {"id":2,"name":"clarita caneca","email":"oi@dedd.com","created_at":"2021-03-26T22:50:04.084Z","updated_at":"2021-03-26T22:50:49.328Z"}
		When the client requests with PATCH /contacts/1, body: {"contact":{"name":"clarita caneca","email":"swsw@eded.dd"},"controller":"contacts","action":"update","id":"1"}, headers: {}
		Then the response status should be 200
		And The JSON response should be {"id":1,"name":"clarita caneca","email":"swsw@eded.dd","created_at":"2021-03-26T22:42:13.214Z","updated_at":"2021-03-26T22:51:01.781Z"}

	Scenario: contacts destroy
		Given There is an instance of Contact with id 1 and params: {"id":1,"name":"clarita caneca","email":"swsw@eded.dd","created_at":"2021-03-26T22:42:13.214Z","updated_at":"2021-03-26T22:51:01.781Z"}
		Given There is an instance of Contact with id 2 and params: {"id":2,"name":"clarita caneca","email":"oi@dedd.com","created_at":"2021-03-26T22:50:04.084Z","updated_at":"2021-03-26T22:50:49.328Z"}
		When the client requests with DELETE /contacts/1, body: {"controller":"contacts","action":"destroy","id":"1"}, headers: {}
		Then the response status should be 200
		And The JSON response should be {}

	Scenario: contacts index
		Given There is an instance of Contact with id 2 and params: {"id":2,"name":"clarita caneca","email":"oi@dedd.com","created_at":"2021-03-26T22:50:04.084Z","updated_at":"2021-03-26T22:50:49.328Z"}
		When the client requests with GET /contacts, body: {"controller":"contacts","action":"index"}, headers: {}
		Then the response status should be 200
		And The JSON response should be [{"id":2,"name":"clarita caneca","email":"oi@dedd.com","created_at":"2021-03-26T22:50:04.084Z","updated_at":"2021-03-26T22:50:49.328Z"}]

