// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'time_range.dart';
import 'dropdown.dart';
import 'day.dart';
import 'tasks.dart';

var task = '';
var index = 0;
var taskdesc = '';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Picker Themed Demo',
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      routes: {
        '/': (context) => HomePage(),
        '/task': (context) => ListviewChecker()
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BodyPart());
  }
}

class BodyPart extends StatefulWidget {
  @override
  _BodyPartState createState() => _BodyPartState();
}

class _BodyPartState extends State<BodyPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              "Create New Task",
              style: TextStyle(
                  fontSize: 50,
                  height: 1.2,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[800]),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey[100])),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey[100])),
                hintText: "Task Name",
                contentPadding: EdgeInsets.zero,
                hintStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[400],
                ),
              ),
              onChanged: (v) {
                task = v;
              },
              style: TextStyle(fontSize: 24),
            ),
            TextFormField(
              maxLength: 25,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey[100])),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey[100])),
                hintText: "Describtion",
                contentPadding: EdgeInsets.zero,
                hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[400],
                ),
              ),
              onChanged: (v) {
                taskdesc = v;
              },
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            DayTile(),
            SizedBox(height: 10),
            MyHomePage(),
            SizedBox(height: 10),
            CustomDropdowner(),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueGrey[100],
                  ),
                  borderRadius: BorderRadius.circular(3)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromRGBO(240, 235, 255, 1),
                            ),
                            child: Icon(
                              Icons.alarm,
                              color: Colors.green,
                              size: 30,
                            ),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Remind Me",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  RemindSwitch()
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                color: Colors.black,
                child: Text(
                  "CREATE TASK",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Colors.white),
                ),
                onPressed: () {
                  debugPrint('$taskArray');
                  taskArray.add({
                    'desc': taskdesc,
                    'title': task,
                    'icn': itemSelect,
                  });
                  

                  index += 1;
                  setState(() {});
                  Navigator.pushNamed(context, '/task');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RemindSwitch extends StatefulWidget {
  @override
  _RemindSwitchState createState() => _RemindSwitchState();
}

class _RemindSwitchState extends State<RemindSwitch> {
  var remindMe = true;
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: remindMe,
        onChanged: (e) {
          remindMe = e;
          setState(() {});
        });
  }
}
