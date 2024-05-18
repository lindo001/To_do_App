

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'customThemes.dart';

class Customwidgets extends StatelessWidget {
    String todo;
    bool isComplete =false;
    final Function editDB;
    final Function markDB;
    final Function removeDB;
    final int index;
    final String dateCreated;

    // DateTime _time = DateTime.now();
  Customwidgets({super.key,
                required this.isComplete,
                required this.todo,
                required this.editDB,
                required this.markDB,
                required this.removeDB,
                required this.index,
                required this.dateCreated
                });

  @override
  Widget build(BuildContext context) {
    final providerLink = Provider.of<CustomThemes>(context);
    DateTime _time = DateTime.now();
    final double _height = MediaQuery.of(context).size.height/8;
    return GestureDetector(
      //Edit
      onTap: ()=> markDB(index),
      //done
      onDoubleTap: ()=>editDB(index),
      //remove
      onLongPress: ()=>removeDB(index),
      child: Container(
        height: _height,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: providerLink.getCurrentTheme().colorScheme.primary,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ContainerTileDetails(isComplete, todo,context),
            // Text(dateCreated)
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
            
          ],
        ),
      ),
    );
  }

  Row ContainerTileDetails(bool isComplete, String todo,BuildContext context) {
    final providerLink = Provider.of<CustomThemes>(context).getCurrentTheme().colorScheme.tertiary;
    // final textColor = providerLink.getCurrentTheme().colorScheme.tertiary;

    return Row(children: [
    isComplete? Icon(Icons.radio_button_unchecked,color: providerLink,):Icon(Icons.check_circle_outline,color: Colors.grey,),
    const SizedBox(width: 5),
    Text(todo, style: TextStyle(decoration: isComplete?TextDecoration.none:TextDecoration.lineThrough,
    
    color: isComplete? providerLink:Colors.grey))

    ],);
  }
}

class Task extends HiveObject{
  late String title;
  late bool isDone;

}