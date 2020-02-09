package global.coda.springservice.api;

import global.coda.springservice.models.InterServiceResponseModel;
import global.coda.springservice.models.ResponseModel;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class SampleApi {

    @Value("${GO_SERVICE_URL:}")
    private String GO_SERVICE_URL;

    @Value("${PYTHON_SERVICE_URL:}")
    private String PYTHON_SERVICE_URL;

    @GetMapping("/")
    public ResponseModel getInfo() {

        ResponseModel response = new ResponseModel();
        response.setServiceName("Spring Service");
        response.setDescription("Hi! This is from Java Spring service");
        response.setAction("This is a basic api - returns a message");

        return response;
    }

    @GetMapping("/interservice/go")
    public ResponseModel getDetailedInfo1() {
        ResponseModel response = new ResponseModel();
        response.setServiceName("Spring Service");
        response.setDescription("Hi! This is from Java Spring service");
        response.setAction("This api will communicate with another service internally and fetch the details");

        RestTemplate restTemplate = new RestTemplate();

        InterServiceResponseModel interServiceResponse = restTemplate.getForObject(GO_SERVICE_URL, InterServiceResponseModel.class);

        response.setValuesFrom(interServiceResponse);

        return response;
    }

    @GetMapping("/interservice/python")
    public ResponseModel getDetailedInfo2() {
        ResponseModel response = new ResponseModel();
        response.setServiceName("Spring Service");
        response.setDescription("Hi! This is from Java Spring service");
        response.setAction("This api will communicate with another service internally and fetch the details");

        RestTemplate restTemplate = new RestTemplate();

        InterServiceResponseModel interServiceResponse = restTemplate.getForObject(PYTHON_SERVICE_URL, InterServiceResponseModel.class);

        response.setValuesFrom(interServiceResponse);

        return response;
    }
}
