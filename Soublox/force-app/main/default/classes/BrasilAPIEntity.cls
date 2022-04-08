public with sharing class BrasilAPIEntity {
    
    public String parameter;
    public String serviceType;

    public BrasilAPIEntity(String serviceType, String parameter) {
        this.serviceType = serviceType;
        this.parameter = parameter;
    }

    public BrasilAPIEntity(String serviceType) {
        this.serviceType = serviceType;
    }

    public Object connect() {

        Http http = new Http();
        HttpRequest request = buildRequest();
        HttpResponse response = http.send(request);
        
        return validateResponse(response);
    }

    private HttpRequest buildRequest() {

        Brasil_API__mdt service = [SELECT Content_Type__c, Endpoint__c, Method__c FROM Brasil_API__mdt WHERE DeveloperName = :this.serviceType];

        HttpRequest request = new HttpRequest();
        request.setMethod(service.Method__c);
        request.setHeader('Content-Type', service.Content_Type__c);

        if (this.parameter == null)
            request.setEndpoint('https://brasilapi.com.br/api/' + service.Endpoint__c.replace('{parameter}', ''));
        else
            request.setEndpoint('https://brasilapi.com.br/api/' + service.Endpoint__c.replace('{parameter}', this.parameter));

        return request;
    }

    private Object validateResponse(HttpResponse response) {

        if (response.getStatusCode() != 200)
            throw new BrasilAPIEntityException('Error on request API' + response.getStatusCode() + response.getBody());
        else
            return response.getBody();

    }

    public class BrasilAPIEntityException extends Exception {}

}