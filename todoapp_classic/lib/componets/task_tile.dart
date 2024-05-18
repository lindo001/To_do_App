import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isComplete;
  final Function? callEdit;
  final Function callRemove;
  final Function updateCompletion;

  TaskTile({
    super.key,
    required this.isComplete,
    required this.callEdit,
    required this.callRemove,
    required this.updateCompletion,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: isComplete,
              onChanged: (s)  {
                print(s);
                updateCompletion(s);},
            ),
            SizedBox(width: 30),
            Text(
              "Eat for the walk",
              style: TextStyle(
                fontFamily: "Orbitron",
                fontSize: 20,
                color: isComplete ? Colors.white60 : Colors.white,
                decoration:
                    isComplete ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
          ],
        ),
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text("Edit"),
              onTap: () => callEdit?.call(),
            ),
            PopupMenuItem(
              child: Text("Remove"),
              onTap: () => callRemove(),
            ),
          ],
          onSelected: (value) => {},
        ),
      ],
    );
  }
}
