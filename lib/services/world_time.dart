import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time; //time for location
  String flag; //flag for location
  String url; //url for API endpoint
  bool isDaytime;

  WorldTime({ this.location, this.flag, this.url});


  Future<void> getTime() async {
    try {
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //ternary operator
      isDaytime = now.hour > 6 && now.hour < 18 ? true : false;

      // set time property
      time = DateFormat.jm().format(now);

    }catch (e){
      print("Caught error: $e");
      time = "FATAL:: Could not get time data!";
    }

  }
}