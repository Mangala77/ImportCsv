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


#### todo list
## heroku deploymet is done with foll
#Addons:         heroku-postgresql:hobby-dev
#Auto Cert Mgmt: false
#Dynos:          web: 1
#Git URL:        https://git.heroku.com/polar-brook-56194.git
#Region:         us
#Repo Size:      0 B
#Slug Size:      39 MB
#Stack:          heroku-16
#Web URL:        https://polar-brook-56194.herokuapp.com/

## herouku url doesnt work due to authorisation so need to test with herouko api test which needs to be fixed


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



To perform every API call we also need a REST-client application. Chrome has a popular extension named “POSTMAN”. Install and open it to execute API calls.

or you can test with CURL with api-token

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


### for api-token authorisation which also can be implememted with auth token using Device gem or jwt gem and bycrypt, so was not sure about what exactly expected, so used comparable token in application controller authentication method.





