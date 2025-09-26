public class HRRestService {
    public static void fetchEmployees() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:HR_API/employees'); // Named Credential reference
        req.setMethod('GET');
        
        Http http = new Http();
        HttpResponse res = http.send(req);
        
        System.debug('Status: ' + res.getStatusCode());
        System.debug('Body: ' + res.getBody());
    }
}