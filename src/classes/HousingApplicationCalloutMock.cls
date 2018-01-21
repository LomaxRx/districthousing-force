@isTest
public class HousingApplicationCalloutMock implements HttpCalloutMock {
    protected String body;

    public HousingApplicationCalloutMock(String body) {
        this.body = body;
    }

    public HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody(this.body);
        res.setStatusCode(200);
        return res;
    }
}