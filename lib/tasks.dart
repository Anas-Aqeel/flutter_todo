import 'package:flutter/material.dart';
import 'dropdown.dart';
import 'day.dart';

List taskArray = [];

class ListviewChecker extends StatefulWidget {
  @override
  _ListviewCheckerState createState() => _ListviewCheckerState();
}

class _ListviewCheckerState extends State<ListviewChecker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 45, 109, 1),
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              decoration: BoxDecoration(color: Color.fromRGBO(8, 45, 109, 1)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$formattedDate',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      '$month $date',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: SingleChildScrollView(
                  child: Expanded(
                child: ListView.builder(
                  itemCount: taskArray.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Icon icnfinder() {
                      var icnnum = int.parse(taskArray[index]['icn']);
                      var find = itemArray.where((e) {
                        return e['id'] == icnnum;
                      }).toList();
                      return find[0][Icon];
                    }

                    return ListTile(
                      contentPadding: EdgeInsets.only(
                          left: 12, right: 12, top: 8, bottom: 8),
                      title: Text(
                        '${taskArray[index]["title"]}',
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.bold),
                      ),
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          icnfinder(),
                        ],
                      ),
                      subtitle: Text(
                        '${taskArray[index]["desc"]}',
                        style: TextStyle(
                            color: Colors.black45, fontWeight: FontWeight.bold),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton(
                            onChanged: (e) {},
                            icon: Icon(Icons.more_vert),
                            underline: SizedBox(),
                            itemHeight: 48,
                            items: [
                              DropdownMenuItem(
                                  onTap: () {
                                    debugPrint('hjhjgvgv');
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Edit Item'),
                                            content: Text('saad'),
                                          );
                                        });
                                    setState(() {});
                                  },
                                  child: Text("Edit")),
                              DropdownMenuItem(
                                  onTap: () {
                                    taskArray.removeAt(index);
                                    debugPrint('$taskArray');
                                    setState(() {});
                                  },
                                  child: Text("Delete"))
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              )),
            )
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
