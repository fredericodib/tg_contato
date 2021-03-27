Feature: bdd_generator

	Scenario: contacts index
		When the client requests with GET /contacts, body: {"controller":"contacts","action":"index"}, headers: {}
		Then the response status should be 200
		And The JSON response should be []

	Scenario: contacts create
		When the client requests with POST /contacts, body: {"contact":{"name":"iio","email":"oi@dedd.com"},"controller":"contacts","action":"create"}, headers: {}
		Then the response status should be 201
		And The JSON response should be {"id":3,"name":"iio","email":"oi@dedd.com","created_at":"2021-03-27T18:35:49.844Z","updated_at":"2021-03-27T18:35:49.844Z"}

	Scenario: contacts create
		Given There is an instance of Contact with id 3 and params: {"id":3,"name":"iio","email":"oi@dedd.com","created_at":"2021-03-27T18:35:49.844Z","updated_at":"2021-03-27T18:35:49.844Z"}
		When the client requests with POST /contacts, body: {"contact":{"name":"teste","email":"test@gmail.com"},"controller":"contacts","action":"create"}, headers: {}
		Then the response status should be 201
		And The JSON response should be {"id":4,"name":"teste","email":"test@gmail.com","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}

	Scenario: contacts create
		Given There is an instance of Contact with id 3 and params: {"id":3,"name":"iio","email":"oi@dedd.com","created_at":"2021-03-27T18:35:49.844Z","updated_at":"2021-03-27T18:35:49.844Z"}
		Given There is an instance of Contact with id 4 and params: {"id":4,"name":"teste","email":"test@gmail.com","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}
		When the client requests with POST /contacts, body: {"contact":{"name":"teste","email":"test@gmail.com"},"controller":"contacts","action":"create"}, headers: {}
		Then the response status should be 422
		And The JSON response should be {"email":["has already been taken"]}

	Scenario: contacts create
		Given There is an instance of Contact with id 3 and params: {"id":3,"name":"iio","email":"oi@dedd.com","created_at":"2021-03-27T18:35:49.844Z","updated_at":"2021-03-27T18:35:49.844Z"}
		Given There is an instance of Contact with id 4 and params: {"id":4,"name":"teste","email":"test@gmail.com","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}
		When the client requests with POST /contacts, body: {"contact":{"name":"teste"},"controller":"contacts","action":"create"}, headers: {}
		Then the response status should be 422
		And The JSON response should be {"email":["can't be blank","is invalid"]}

	Scenario: contacts create
		Given There is an instance of Contact with id 3 and params: {"id":3,"name":"iio","email":"oi@dedd.com","created_at":"2021-03-27T18:35:49.844Z","updated_at":"2021-03-27T18:35:49.844Z"}
		Given There is an instance of Contact with id 4 and params: {"id":4,"name":"teste","email":"test@gmail.com","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}
		When the client requests with POST /contacts, body: {"contact":{"email":"test@gmail.com"},"controller":"contacts","action":"create"}, headers: {}
		Then the response status should be 422
		And The JSON response should be {"email":["has already been taken"],"name":["can't be blank"]}

	Scenario: contacts index
		Given There is an instance of Contact with id 3 and params: {"id":3,"name":"iio","email":"oi@dedd.com","created_at":"2021-03-27T18:35:49.844Z","updated_at":"2021-03-27T18:35:49.844Z"}
		Given There is an instance of Contact with id 4 and params: {"id":4,"name":"teste","email":"test@gmail.com","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}
		When the client requests with GET /contacts, body: {"controller":"contacts","action":"index"}, headers: {}
		Then the response status should be 200
		And The JSON response should be [{"id":3,"name":"iio","email":"oi@dedd.com","created_at":"2021-03-27T18:35:49.844Z","updated_at":"2021-03-27T18:35:49.844Z"},{"id":4,"name":"teste","email":"test@gmail.com","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}]

	Scenario: contacts show
		Given There is an instance of Contact with id 3 and params: {"id":3,"name":"iio","email":"oi@dedd.com","created_at":"2021-03-27T18:35:49.844Z","updated_at":"2021-03-27T18:35:49.844Z"}
		Given There is an instance of Contact with id 4 and params: {"id":4,"name":"teste","email":"test@gmail.com","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}
		When the client requests with GET /contacts/4, body: {"controller":"contacts","action":"show","id":"4"}, headers: {"Authorization":"dedeed"}
		Then the response status should be 200
		And The JSON response should be {"id":4,"name":"teste","email":"test@gmail.com","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}

	Scenario: contacts show
		Given There is an instance of Contact with id 3 and params: {"id":3,"name":"iio","email":"oi@dedd.com","created_at":"2021-03-27T18:35:49.844Z","updated_at":"2021-03-27T18:35:49.844Z"}
		Given There is an instance of Contact with id 4 and params: {"id":4,"name":"teste","email":"test@gmail.com","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}
		When the client requests with GET /contacts/3, body: {"controller":"contacts","action":"show","id":"3"}, headers: {"Authorization":"dedeed"}
		Then the response status should be 200
		And The JSON response should be {"id":3,"name":"iio","email":"oi@dedd.com","created_at":"2021-03-27T18:35:49.844Z","updated_at":"2021-03-27T18:35:49.844Z"}

	Scenario: contacts update
		Given There is an instance of Contact with id 3 and params: {"id":3,"name":"iio","email":"oi@dedd.com","created_at":"2021-03-27T18:35:49.844Z","updated_at":"2021-03-27T18:35:49.844Z"}
		Given There is an instance of Contact with id 4 and params: {"id":4,"name":"teste","email":"test@gmail.com","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}
		When the client requests with PATCH /contacts/3, body: {"contact":{"name":"teste 2"},"controller":"contacts","action":"update","id":"3"}, headers: {}
		Then the response status should be 200
		And The JSON response should be {"id":3,"name":"teste 2","email":"oi@dedd.com","created_at":"2021-03-27T18:35:49.844Z","updated_at":"2021-03-27T18:36:49.150Z"}

	Scenario: contacts update
		Given There is an instance of Contact with id 3 and params: {"id":3,"name":"teste 2","email":"oi@dedd.com","created_at":"2021-03-27T18:35:49.844Z","updated_at":"2021-03-27T18:36:49.150Z"}
		Given There is an instance of Contact with id 4 and params: {"id":4,"name":"teste","email":"test@gmail.com","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}
		When the client requests with PATCH /contacts/4, body: {"contact":{"email":"test@gmail.com"},"controller":"contacts","action":"update","id":"4"}, headers: {}
		Then the response status should be 200
		And The JSON response should be {"id":4,"email":"test@gmail.com","name":"teste","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}

	Scenario: contacts update
		Given There is an instance of Contact with id 3 and params: {"id":3,"name":"teste 2","email":"oi@dedd.com","created_at":"2021-03-27T18:35:49.844Z","updated_at":"2021-03-27T18:36:49.150Z"}
		Given There is an instance of Contact with id 4 and params: {"id":4,"name":"teste","email":"test@gmail.com","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}
		When the client requests with PATCH /contacts/4, body: {"contact":{"email":"test@gmail.com"},"controller":"contacts","action":"update","id":"4"}, headers: {}
		Then the response status should be 200
		And The JSON response should be {"id":4,"email":"test@gmail.com","name":"teste","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}

	Scenario: contacts show
		Given There is an instance of Contact with id 3 and params: {"id":3,"name":"teste 2","email":"oi@dedd.com","created_at":"2021-03-27T18:35:49.844Z","updated_at":"2021-03-27T18:36:49.150Z"}
		Given There is an instance of Contact with id 4 and params: {"id":4,"name":"teste","email":"test@gmail.com","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}
		When the client requests with GET /contacts/3, body: {"controller":"contacts","action":"show","id":"3"}, headers: {"Authorization":"dedeed"}
		Then the response status should be 200
		And The JSON response should be {"id":3,"name":"teste 2","email":"oi@dedd.com","created_at":"2021-03-27T18:35:49.844Z","updated_at":"2021-03-27T18:36:49.150Z"}

	Scenario: contacts update
		Given There is an instance of Contact with id 3 and params: {"id":3,"name":"teste 2","email":"oi@dedd.com","created_at":"2021-03-27T18:35:49.844Z","updated_at":"2021-03-27T18:36:49.150Z"}
		Given There is an instance of Contact with id 4 and params: {"id":4,"name":"teste","email":"test@gmail.com","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}
		When the client requests with PATCH /contacts/3, body: {"contact":{"email":"test@gmail.com"},"controller":"contacts","action":"update","id":"3"}, headers: {}
		Then the response status should be 422
		And The JSON response should be {"email":["has already been taken"]}

	Scenario: contacts index
		Given There is an instance of Contact with id 3 and params: {"id":3,"name":"teste 2","email":"oi@dedd.com","created_at":"2021-03-27T18:35:49.844Z","updated_at":"2021-03-27T18:36:49.150Z"}
		Given There is an instance of Contact with id 4 and params: {"id":4,"name":"teste","email":"test@gmail.com","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}
		When the client requests with GET /contacts, body: {"controller":"contacts","action":"index"}, headers: {}
		Then the response status should be 200
		And The JSON response should be [{"id":3,"name":"teste 2","email":"oi@dedd.com","created_at":"2021-03-27T18:35:49.844Z","updated_at":"2021-03-27T18:36:49.150Z"},{"id":4,"name":"teste","email":"test@gmail.com","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}]

	Scenario: contacts destroy
		Given There is an instance of Contact with id 3 and params: {"id":3,"name":"teste 2","email":"oi@dedd.com","created_at":"2021-03-27T18:35:49.844Z","updated_at":"2021-03-27T18:36:49.150Z"}
		Given There is an instance of Contact with id 4 and params: {"id":4,"name":"teste","email":"test@gmail.com","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}
		When the client requests with DELETE /contacts/3, body: {"controller":"contacts","action":"destroy","id":"3"}, headers: {}
		Then the response status should be 200
		And The JSON response should be {}

	Scenario: contacts index
		Given There is an instance of Contact with id 4 and params: {"id":4,"name":"teste","email":"test@gmail.com","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}
		When the client requests with GET /contacts, body: {"controller":"contacts","action":"index"}, headers: {}
		Then the response status should be 200
		And The JSON response should be [{"id":4,"name":"teste","email":"test@gmail.com","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}]

	Scenario: contacts destroy
		Given There is an instance of Contact with id 4 and params: {"id":4,"name":"teste","email":"test@gmail.com","created_at":"2021-03-27T18:36:02.448Z","updated_at":"2021-03-27T18:36:02.448Z"}
		When the client requests with DELETE /contacts/4, body: {"controller":"contacts","action":"destroy","id":"4"}, headers: {}
		Then the response status should be 200
		And The JSON response should be {}

	Scenario: contacts index
		When the client requests with GET /contacts, body: {"controller":"contacts","action":"index"}, headers: {}
		Then the response status should be 200
		And The JSON response should be []

