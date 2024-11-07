import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> location = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.jpg'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.jpg'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.jpg'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.jpg'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.jpg'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.jpg'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.jpg'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.jpg'),
    WorldTime(url: 'Asia/colombo', location: 'Colombo', flag: 'sri_lanka.jpg'),
    WorldTime(url: 'Asia/Mumbai', location: 'Mumbai', flag: 'india.jpg'),
  ];

  void updateTime(index) async {
    WorldTime instance = location[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('choose a location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: location.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(location[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${location[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
