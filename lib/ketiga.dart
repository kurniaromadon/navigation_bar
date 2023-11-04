import 'dart:developer';

import 'package:flutter/material.dart';

class KetigaPage extends StatefulWidget {
  const KetigaPage({super.key});

  @override
  State<KetigaPage> createState() => _KetigaPageState();
}

class _KetigaPageState extends State<KetigaPage>{
  TimeOfDay? picked_time, selectedTime=TimeOfDay.now();

  Future<Null> getTime(BuildContext context) async{
    picked_time = await showTimePicker(
      context: context, 
      initialTime: selectedTime!);
      log(picked_time.toString());

    if (picked_time != null && picked_time != selectedTime){
      setState(() {
        selectedTime = picked_time;
        log("test" + picked_time.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
      children: <Widget>[
      MaterialButton(
          onPressed: () {getTime(context);},
          child: Text("Test TimePicker"),
          ),
          Text("${selectedTime.toString().substring(10, 15)}"),
      ]
      ),
    );
  }
}