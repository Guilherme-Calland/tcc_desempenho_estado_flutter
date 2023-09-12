import 'package:flutter/material.dart';

class RecipeSectionList extends StatelessWidget {

  final List<Widget> sectionList;

  const RecipeSectionList(this.sectionList);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 4, color: Colors.white),
      ), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  _buildCustomColumn()
        
        ,
      ),
    );
  }

  _buildCustomColumn() {
    List<Widget> organizedList = [];

    for(int i = 0; i < sectionList.length; i++){
      late Widget organizedSection;
      Padding paddedSection = Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: sectionList[i],
      );
      if(i == 0){
        organizedSection = paddedSection;
      }else{
        organizedSection = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: Colors.white,),
            paddedSection,
          ],
        );
      }

      organizedList.add(organizedSection);
    } 

    return organizedList;
    
  }
}

