from flask import Flask
from flask_restful import Resource, Api
import json
import requests
import os

app = Flask(__name__)
api = Api(app)



class BasicInfo(Resource):
    def get(self):
        data = {
            "serviceName" : "Python Service",
            "description" : "Hi! This is from Python Service",
            "action" : "This is a basic api - returns a message"
        }
        return data

api.add_resource(BasicInfo, "/")


class DetailedInfo(Resource):
    def get(self):
        contents = requests.get(os.environ.get('GO_SERVICE_URL'))
 #       jsonContent = json.loads(contents.decode())
        data = {
            "serviceName" : "Python Service",
            "description" : "Hi! This is from Python Service",
            "action" : "This api will communicate with another service internally and fetch the details"
        }

        data["valuesFrom"] = contents.json()
        return data

api.add_resource(DetailedInfo, "/inter")
