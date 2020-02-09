
# Python Service - A simple python service to demonstrate microservices rightstart kit
### Installation
To install dependencies

```pip install -r requirements.txt```

To run locally,

export FLASK_APP="main.py"
flask run

Or, give permission to run.sh
```
    chmod +x ./run.sh
    ./run.sh
```
### Environment variable

```export GO_SERVICE_URL="http://127.0.0.1:8000/go-service"```


### Available Endpoints

1. /api/python-service  - This is a basic api - returns a message.

2. /api/python-service/inter  -  This api will communicate with another service internally and fetch the details