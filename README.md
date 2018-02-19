Tasks to complete

Amend and complete our restful API

A Company:
  - can have multiple regions (e.g. US, EU), and each region can have multiple branches (e.g. London, Berlin). Define a hierarchy to represent this logic.
  - has many Services. If there are multiple branches, they will all share the same services
  - can be disabled

A Service:
  - has a duration
  - has a price
  - can be disabled
  - if the company is disabled, all services are disabled.

Deliverables:

* Create a command-line script to import the data from the csv provided in the folder bb_test/lib/data/ (check the parsing rules)

* Build the following endpoints:
  - Full CRUD for services
  - Just Read for companies
  
* If a user makes a request to your API endpoint, they must pass in the header 'API-Token' with the value 'secret123'.

* Add tests for both happy and sad path outcomes

* Be prepared to talk through your approach and any significant design decisions that you made whilst completing this challenge.

* Please provide all the steps needed to run the project.

Parsing Rules:

* If the csv contains duplicates, we don't want them imported



#running  on ruby 2.3.1 and Rails 5.1.4

To test import csv:

1. rake db:create
2. rake db:migrate
3. rails import:company_data


To test api:
Run the application
rails s



### without authentication
to test in browser
just comment before_action :authenticate   --- in app/controllers/application_controllers.rb

Get all service
url: http://localhost:3000/v1/services
method: ‘GET’

Creating a new service
url: http://localhost:3000/v1/services
method: ‘POST’
parameters  { name: 'Design with HTML/CSS', price:120, duration:30, disabled: false, company_id: 1} 

Updating a services
url: http://localhost:3000/v1/services/:id
method: ‘PUT’
parameters body: { name: 'Design with HTML/CSS'}

Deleting a services
url: http://localhost:3000/v1/services/:id
method: ‘DELETE’


Get all companies
url: http://localhost:3000/v1/companies
method: ‘GET’


To Test API
for eg:

Get all service:

curl -i -H "Authorization: Token token=secret123" http://localhost:3000/v1/services

GET one service:

curl -i -H "Authorization: Token token=secret123" http://localhost:3000/v1/services/1

Create service:

curl -d 'service[name]=sony&service[duration]=30&service[price]=120&service[disabled]=false&service[company_id]=1' -H "Authorization: Token token=secret123" -X POST http://localhost:3000/v1/services

Update Service:

curl -d 'service[name]=samsung' -H "Authorization: Token token=secret123" -X PUT http://localhost:3000/v1/services/47

Delete Service:

curl -H "Authorization: Token token=secret123" -X "DELETE" http://localhost:3000/v1/services/47






