import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/Model-Third%20Party/Firestore.dart';

class ListBlock extends StatefulWidget {
  ListBlock({this.id, this.item});
  final item;
  final id;
  @override
  _ListBlockState createState() => _ListBlockState();
}

class _ListBlockState extends State<ListBlock> {
  var crossOff = false;

  strikeThough() {
    setState(() {
      crossOff = !crossOff;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool fade = true;
    return GestureDetector(
      onHorizontalDragStart: (details) {
        strikeThough();
      },
      child: LongPressDraggable(
        data: widget.id,
        feedback: Container(
          child: Card(
            child: Text(
              widget.item,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ),
        child: AnimatedContainer(
          duration: Duration(seconds: 3),
          color: fade ? Colors.lightBlue : Colors.white,
          child: ListTile(
            title: Text(
              widget.item,
              style: TextStyle(
                  fontSize: 25,
                  decoration: crossOff
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          ),
        ),
        childWhenDragging: Container(),
      ),
    );
  }
}
