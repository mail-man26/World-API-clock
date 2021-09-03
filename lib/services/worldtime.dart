import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Worldtime {
  Worldtime({
    this.flag,
    this.url,
    this.time,
    this.location,
  });
  String flag;
  String url;
  String time;
  String location;
  bool isdaytime;

  Future<void> getTime() async {
    try {
      //print('https://worldtimeapi.org/api/timezone/$url');
      http.Response response = await http
          .get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = convert.jsonDecode(response.body);
      //print(data);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //to set the time property
      isdaytime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
      time = 'not available';
    }
  }
}
