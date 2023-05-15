import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String url;
  String time = '';
  String flag;
  bool isDaytime = true;

  WorldTime({this.location = '', this.url = '', this.flag = ''});

  Future<void> getTime() async {
    try {
      String urlstr = 'https://worldtimeapi.org/api/timezone/$url';
      Uri link = Uri.parse(urlstr);

      Response response = await get(link);
      Map data = jsonDecode(response.body);
      String datetime = data['utc_datetime'];
      int offset1 = int.parse(data['utc_offset'].substring(1, 3));
      int offset2 = int.parse(data['utc_offset'].substring(4, 6));
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: offset1));
      now = now.add(Duration(minutes: offset2));

      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught error: $e');
      time = 'Cannot Load The Time';
    }
  }
}
