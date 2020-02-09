package global.coda.springservice.models;

import com.fasterxml.jackson.annotation.JsonInclude;

public class ResponseModel {

    String serviceName;

    String description;

    String action;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    InterServiceResponseModel valuesFrom;

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public InterServiceResponseModel getValuesFrom() {
        return valuesFrom;
    }

    public void setValuesFrom(InterServiceResponseModel valuesFrom) {
        this.valuesFrom = valuesFrom;
    }
}

