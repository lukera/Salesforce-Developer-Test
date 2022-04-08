//Transfer Object
global with sharing class HolidayVO {

    global String holidayDate { get; set ;}
    global String name { get; set ;}
    global String type { get; set ;}
    global String message { get; set ;} //In case of errors

}