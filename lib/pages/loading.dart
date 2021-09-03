import 'package:flutter/material.dart';
import 'package:world/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';
  void setuptime() async {
    Worldtime instance =
        Worldtime(location: 'Japan', url: 'Asia/Tokyo', flag: 'japanese');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isdaytime': instance.isdaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setuptime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SpinKitWave(
            color: Colors.blue,
            size: 54,
          ),
        ));
  }
}
