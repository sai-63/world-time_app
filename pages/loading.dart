import 'package:flutter/material.dart';
import 'package:weather_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time='Loading';

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'India',url: 'Asia/Kolkata',flag: '');
    await instance.getTime();
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'wpDay': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Hi'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpinKitDualRing(
            color: Colors.white,
            size: 50.0,
          ),
          SizedBox(height: 10.0),
          Text(
              'Loading...',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10.0
            ),
          )
        ],
      ),
    );
  }
}
