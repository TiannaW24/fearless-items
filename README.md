# Items API

The Items API provides several RESTful endpoints to retrieve, add, and delete Item entities

## Getting Started

These instructions will get you a copy of the application up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the Items application.

#### Prerequisites

* Docker v20.10.5
    * Ruby v.3.0.0
    * Rails v.6.1.3.1

#### Database Setup

The Items application uses in-memory cacheing to store the Items, a separate database is not required.

#### Application Setup

The Items application is containerized using a Docker image, served on port 3000. Specifications for the Docker container, including required installations can be found in the Dockerfile.

## Unit Tests

The application uses Rspec for unit testing

To run the unit tests, use the following command ```bundle exec rspec```

## Deployment


## Releases
* March 31 - v1.0.0 
    * Initial application creation with ability to show, add, update, and destroy Items

## Future Features
* Implement endpoint versioning
* Implement authentication to prevent unauthorized access to the api
* Implement a Swagger interface to document endpoint specification and generate test cases
