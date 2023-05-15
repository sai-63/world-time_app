import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  String time = '';
  String ima = '';

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty
        ? ModalRoute.of(context)?.settings.arguments as dynamic
        : data;
    print(data['time']);
    time = data['time'];
    ima = data['wpDay'] ? 'assets/day.jpg' : 'assets/night.jpg';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ima), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'wpDay': result['wpDay'],
                        'flag': result['flag']
                      } as Map;
                    });
                  },
                  icon: Icon(
                    Icons.location_on_outlined,
                    color: Colors.black,
                  ),
                  label: Text('Choose Location')),
              SizedBox(
                height: 20.0,
              ),
              Column(
                children: [
                  Text(
                    data['location'],
                    style:
                        TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    data['time'],
                    style:
                        TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
