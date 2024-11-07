import 'package:flutter/material.dart';
import 'package:world_time/loading.dart';
import 'package:world_time/home.dart';
import 'package:world_time/choose_location.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/', routes: {
      '/': (contex) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    }));
