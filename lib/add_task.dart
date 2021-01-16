import 'package:flutter/material.dart';

AlertDialog leadDialog = AlertDialog(
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0))),
  content: Container(
    height: 450,
    width: 350,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            '  Add New Task',
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 27,
                fontWeight: FontWeight.w800,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1, 1),
                    blurRadius: 3,
                    color: Colors.grey[500].withOpacity(1.0),
                  ),
                ]),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          height: 45,
          width: 300,
          padding: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.pink[50],
                  offset: Offset(-2.0, -2.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
                hintText: "       Enter the task....",
                hintStyle: TextStyle(color: Colors.grey[700]),
                border: InputBorder.none),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              color: Colors.white,
              child: Text('Date'),
              onPressed: () {},
            ),
            SizedBox(
              width: 300,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              color: Colors.white,
              child: Text('Time'),
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          color: Colors.blue[300],
          child: Text(
            '  ADD  ',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {},
        ),
        SizedBox(
          height: 50,
        )
      ],
    ),
  ),
);
