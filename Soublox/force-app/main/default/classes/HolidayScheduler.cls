global class HolidayScheduler implements Schedulable, Database.AllowsCallouts {

    global String year;

    global HolidayScheduler(String year) {
        this.year = year;
    }

    global void execute(SchedulableContext SC) {
        
        FeriadosNacionaisService.getHolidays(this.year);

    }

}