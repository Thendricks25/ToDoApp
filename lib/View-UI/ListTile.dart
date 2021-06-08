import 'package:flutter/material.dart';

class ListBlock extends StatefulWidget {
  ListBlock({this.id, this.item});
  final item;
  final id;

  @override
  _ListBlockState createState() => _ListBlockState();
}

class _ListBlockState extends State<ListBlock> {
  var crossOff = false;
  bool get striker => crossOff;

  strikeThough() {
    setState(() {
      crossOff = !crossOff;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            ListTile(
              title: Text(
                widget.item,
                style: TextStyle(
                    fontSize: 25,
                    decoration: crossOff
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ),
            Divider(
              color: Colors.black54,
            )
          ],
        ),
        childWhenDragging: Container(),
      ),
    );
  }
}
