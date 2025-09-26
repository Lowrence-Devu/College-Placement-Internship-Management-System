public class HRApiTest {
    public static void fetchUsers() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:HR_API'); // Named Credential
        req.setMethod('GET');

        Http http = new Http();
        HttpResponse res = http.send(req);

        System.debug('Status Code: ' + res.getStatusCode());
        System.debug('Response Body: ' + res.getBody());
    }
}