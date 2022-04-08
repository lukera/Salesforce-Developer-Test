@isTest
public class BrasilAPIEntityTest {
    
    @isTest
    public static void shouldConnect() {

        Test.setMock(HttpCalloutMock.class, new BrasilAPIEntityTest.BrasilAPIEntity200Mock());

        Test.startTest();

        BrasilAPIEntity entity = new BrasilAPIEntity('FeriadosNacionais', '2022');

        Object obj = entity.connect();

        Test.stopTest();

        System.assert(obj != null);

    }

    @isTest
    public static void shouldNotConnect() {

        Test.setMock(HttpCalloutMock.class, new BrasilAPIEntityTest.BrasilAPIEntity404Mock());

        Test.startTest();

        BrasilAPIEntity entity = new BrasilAPIEntity('FeriadosNacionais', '20222');

        Object obj;

        try {
            obj = entity.connect();
        }catch(Exception e) {
            //do something
        }

        Test.stopTest();

        System.assert(obj == null);

    }

    @isTest
    public static void shouldGiveError() {

        Test.setMock(HttpCalloutMock.class, new BrasilAPIEntityTest.BrasilAPIEntity500Mock());

        Test.startTest();

        BrasilAPIEntity entity = new BrasilAPIEntity('FeriadosNacionais');

        Object obj;
        
        try {
            obj = entity.connect();
        }catch(Exception e) {
            //do something
        }

        Test.stopTest();

        System.assert(obj == null);

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

    public class BrasilAPIEntity404Mock implements HttpCalloutMock {

        public HTTPResponse respond(HTTPRequest req) {
            
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('{"type":"feriados_range_error","message":"Ano fora do intervalo suportado entre 1900 e 2199."}');
            res.setStatusCode(404);

            return res;
        }

    }

    public class BrasilAPIEntity500Mock implements HttpCalloutMock {

        public HTTPResponse respond(HTTPRequest req) {
            
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('{"type":"feriados_error","message":"Erro ao calcular feriados."}');
            res.setStatusCode(500);

            return res;
        }

    }

}