import 'package:flutter/material.dart';

var itemSelect = '1';

var itemArray = <Map>[
  {
    'txt': 'Work',
    Icon: Icon(
      Icons.web_asset,
      color: Colors.orangeAccent,
    ),
    'id': 1
  },
  {
    'txt': 'Job',
    Icon: Icon(
      Icons.work,
      color: Colors.blueAccent,
    ),
    'id': 2
  },
  {
    'txt': 'Business',
    Icon: Icon(
      Icons.business,
      color: Colors.redAccent,
    ),
    'id': 3
  },
  {
    'txt': 'Rest',
    Icon: Icon(
      Icons.nights_stay,
      color: Colors.black38,
    ),
    'id': 4
  }
];

class CustomDropdown extends StatefulWidget {
  final String txt;
  final Icon icn;
  const CustomDropdown({Key key, this.txt, this.icn}) : super(key: key);
  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 250, 230, 1),
                ),
                child: Center(
                  child: widget.icn,
                )),
            SizedBox(
              width: 20,
            ),
            Text(
              "${widget.txt}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            // CustomDropdowner()
          ],
        ),
      ],
    );
  }
}

class CustomDropdowner extends StatefulWidget {
  @override
  _CustomDropdownerState createState() => _CustomDropdownerState();
}

class _CustomDropdownerState extends State<CustomDropdowner> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            color: Colors.blueGrey[100],
          ),
        ),
        child: DropdownButton(
            value: itemSelect,
            icon: Icon(Icons.arrow_forward_ios),
            itemHeight: 60,
            onChanged: (e) {},
            underline: SizedBox(),
            isExpanded: true,
            items: itemArray
                .map((e) => DropdownMenuItem(
                    onTap: () {
                      setState(() {
                        itemSelect = "${e['id']}";
                      });
                    },
                    value: "${e['id']}",
                    child: CustomDropdown(
                      txt: '${e["txt"]}',
                      icn: e[Icon],
                    )))
                .toList()));
  }
}
