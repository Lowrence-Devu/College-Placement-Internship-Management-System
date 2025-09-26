public class MyRestService {
    public static void fetchData() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:My_API/v1/data'); // Named Credential reference
        req.setMethod('GET');
        
        Http http = new Http();
        HttpResponse res = http.send(req);
        
        System.debug('Status: ' + res.getStatusCode());
        System.debug('Body: ' + res.getBody());
    }
}