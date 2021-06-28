import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var currentdate = new DateTime.now();
var day = DateFormat('EEEE').format(currentdate);
var date = DateFormat('dd').format(currentdate);
var month = DateFormat('MMMM').format(currentdate);
String formattedDate = DateFormat('h:mm a').format(currentdate);

var finalDate = '$day $date, $month';

class DayTile extends StatefulWidget {
  @override
  _DayTileState createState() => _DayTileState();
}

class _DayTileState extends State<DayTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: false,
      shape: CircleBorder(),
      leading: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 240, 240, 1),
            borderRadius: BorderRadius.circular(10)),
        child: Icon(
          Icons.calendar_today,
          color: Colors.redAccent,
        ),
      ),
      title: Text(
        '$day $date, $month',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      tileColor: Colors.grey[100],
    );
  }
}
