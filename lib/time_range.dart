import 'package:flutter/material.dart';
import 'package:time_range_picker/time_range_picker.dart';

var currentdate = new DateTime.now();

TimeRange result;
String finalTime;

void assignTime() {
  if (result != null) {
    finalTime =
        '${result.startTime.hour}:${result.startTime.minute} - ${result.endTime.hour}:${result.endTime.minute}';
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        result = await showTimeRangePicker(
          start: result != null ? result.startTime : null,
          end: result != null ? result.endTime : null,
          labelOffset: 5,
          timeTextStyle: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.w800),
          context: context,
        );
        assignTime();
        setState(() {});
      },
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(255, 250, 240, 1)),
          child: Icon(Icons.lock_clock),
        ),
        title: Text(
          result != null ? '$finalTime' : '1:00 - 3:00 PM',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        tileColor: Colors.grey[100],
      ),
    );
  }
}
