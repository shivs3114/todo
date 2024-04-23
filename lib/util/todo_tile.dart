import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String name;
  final bool done;
  Function(bool?)? onChanged;
  Function(BuildContext) deleteFunc;

  TodoTile(
      {required this.name,
      required this.done,
      required this.onChanged,
      required this.deleteFunc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
                onPressed: deleteFunc,
                icon: Icons.delete,
                backgroundColor: Colors.red),
          ],
        ),
        child: Container(
          alignment: Alignment.center,
          child: Row(
            children: [
              Checkbox(
                value: done,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                name,
                style: TextStyle(
                    decoration: done
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.pink[200], borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(12),
        ),
      ),
    );
  }
}
