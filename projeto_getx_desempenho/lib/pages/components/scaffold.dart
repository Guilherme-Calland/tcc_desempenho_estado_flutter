import 'package:flutter/material.dart';

import '../../styles.dart';
import 'buttons/createbtn.dart';
import 'buttons/deletebtn.dart';
import 'buttons/loadbtn.dart';
import 'buttons/updatebtn.dart';
import 'list.dart';

class ScreenScaffold extends StatelessWidget {
  final ItemList itemList;
  final CreateButton createButton;
  final ReadButton readButton;
  final UpdateButton updateButton;
  final DeleteButton deleteButton;

  const ScreenScaffold({
    required this.itemList,
    required this.createButton,
    required this.readButton,
    required this.updateButton,
    required this.deleteButton
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              createButton,
              SizedBox(width: 4),
              readButton,
              SizedBox(width: 4),
              updateButton,
              SizedBox(width: 4),
              deleteButton,
          
            ],
          ),
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
            ),
            
            Expanded(
              child: itemList,
            ),
                  ],
                ),
          )),
    );
  }
}

