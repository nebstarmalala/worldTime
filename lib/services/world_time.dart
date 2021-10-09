import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String time; //time for location
  String flag; //flag for location
  String url; //url for API endpoint

  WorldTime({ this.location, this.flag, this.url});


  Future<void> getTime() async {
    try {
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set time property
      time = now.toString();
    }catch (e){
      print("Caught error: $e");
      time = "FATAL:: Could not get time data!";
    }

  }
}