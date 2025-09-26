public class HRIntegrationService {
    // Method to fetch external job postings
    public static void fetchExternalJobPostings() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://jsonplaceholder.typicode.com/posts');
        req.setMethod('GET');
        
        Http http = new Http();
        HttpResponse res = http.send(req);
        
        if(res.getStatusCode() == 200) {
            System.debug('External Job Postings: ' + res.getBody());
        } else {
            System.debug('Error: ' + res.getStatus());
        }
    }
}