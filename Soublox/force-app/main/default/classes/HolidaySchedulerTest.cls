@isTest
public class HolidaySchedulerTest {
    
    @isTest
    public static void shouldSchedule() {

        Test.setMock(HttpCalloutMock.class, new BrasilAPIEntityTest.BrasilAPIEntity200Mock());

        Test.startTest();

        HolidayScheduler schedule = new HolidayScheduler('2022');
        String sch = '0 0 0 1 1 ?';
        System.schedule('HolidayScheduler', sch, schedule);

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