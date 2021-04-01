# Items API

The Items API provides several RESTful endpoints to retrieve, add, and delete Item entities

## Getting Started

These instructions will get you a copy of the application up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the Items application.

#### Built With

* Docker v20.10.5 - required 
* Docker-Compose v1.28.5 - required
* Ruby v3.0.0
* Rails v6.1.3.1

#### Database and Application Setup

The application is containerized using Docker and served on port 3000. Specifications for the Docker container, including required installations can be found in the Dockerfile.

Postgres is the database used to store the Items and is served on port 5432. 

To change the ports either service is served up on, update the port values in the Dockerfile and docker-compose.yml file. 

Both the web app and Postgres service are managed as individual services by docker-compose. Follow the steps below to build the two services required for the application.

1. Build the two services (web & postgresql) using docker-compose
```docker-compose build```

2. Initial DB migration
```docker-compose run web rails db:migrate```

3. Bring up the app
```docker-compose up```

## Unit Tests

The application uses Rspec for unit testing.

To run the unit tests, use the following command ```bundle exec rspec```


## Releases
* March 31 - v1.0.0 
    * Initial application creation with ability to show, add, update, and destroy Items

## Future Features
* Implement several additional environments for testing, staging and production
* Implement endpoint versioning
* Implement authentication to prevent unauthorized access to the api
* Implement a Swagger interface to document endpoint specifications and generate test cases
