import 'package:flutter/material.dart';
import '../styles.dart';
import 'components/buttons/createbtn.dart';
import 'components/buttons/deletebtn.dart';
import 'components/buttons/loadbtn.dart';
import 'components/buttons/updatebtn.dart';
import 'components/list.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CreateBtn(),
              SizedBox(width: 4),
              LoadButton(),
              SizedBox(width: 4),
              UpdateBtn(),
              SizedBox(width: 4),
              DeleteBtn(),
          
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
              child: ItemList(),
            ),
                  ],
                ),
          )),
    );
  }
}



