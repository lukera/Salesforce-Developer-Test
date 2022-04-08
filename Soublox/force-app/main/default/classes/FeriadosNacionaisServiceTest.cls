@isTest
public class FeriadosNacionaisServiceTest {
    
    @isTest
    public static void shouldGetHolidays() {

        Test.setMock(HttpCalloutMock.class, new BrasilAPIEntityTest.BrasilAPIEntity200Mock());

        Test.startTest();

        FeriadosNacionaisService.getHolidays('2022');

        Test.stopTest();

    }

    public class BrasilAPIEntity200Mock implements HttpCalloutMock {

        public HTTPResponse respond(HTTPRequest req) {
            
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('[{"date":"2021-01-01","name":"Confraternização mundial","type":"national"}]');
            res.setStatusCode(200);

            return res;
        }

    }

}