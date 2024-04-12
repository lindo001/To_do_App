

class Dateformater{
  final DateTime _today = DateTime.now();

String getCurrentDate(){
    final imonth = month(_today.month.toInt());
  final idate = _today.day.toString();
  final iyear = _today.year.toString();
  return imonth + " " + idate + " " + iyear;
}

String month(int month) {
  switch (month) {
    case 1:
      return "Jan";
    case 2:
      return "Feb";
    case 3:
      return "Mar";
    case 4:
      return "Apr";
    case 5:
      return "May";
    case 6:
      return "Jun";
    case 7:
      return "Jul";
    case 8:
      return "Aug";

    case 9:
      return "Sep";
    case 10:
      return "Oct";
    case 11:
      return "Nov";
    // Add cases for other months as needed
    default:
      return "Dec";
  }
  }
  }