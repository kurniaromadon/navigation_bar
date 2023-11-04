import 'package:flutter/material.dart';

class KeduaPage extends StatefulWidget {
  const KeduaPage({super.key});

  @override
  State<KeduaPage> createState() => _KeduaPageState();
}

class _KeduaPageState extends State<KeduaPage>{
  DateTime? dateTimenow=DateTime.now(), dateTimeTomorrow, picked_date;
  var year, month, day;
  

  Future<Null> getDate(BuildContext context) async{
    picked_date = await  showDatePicker(
      context: context, 
      initialDate: dateTimenow!, 
      firstDate: DateTime(dateTimenow!.year - 10), 
      lastDate: DateTime(dateTimenow!.year + 10));

    if (picked_date !=null && picked_date != dateTimenow){
      setState(() {
        dateTimenow = picked_date;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Center(
    child: Column(
      children: <Widget>[
        MaterialButton(
          onPressed: () {getDate(context);},
          child: Text("Test DatePicker"),
          ),
          Text("${dateTimenow.toString().substring(0, 10)}"),
      ],
      ),
  );
}
}