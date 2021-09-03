import 'package:flutter/material.dart';
import 'package:world/services/worldtime.dart';

class Chooselocation extends StatefulWidget {
  @override
  _ChooselocationState createState() => _ChooselocationState();
}

class _ChooselocationState extends State<Chooselocation> {
  List<Worldtime> locations = [
    Worldtime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    Worldtime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    Worldtime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    Worldtime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    Worldtime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    Worldtime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    Worldtime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    Worldtime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updatetime(index) async {
    Worldtime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isdaytime': instance.isdaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('choose location'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updatetime(index);
                  },
                  title: Text(locations[index].location),
                ),
              ),
            );
          }),
    );
  }
}
