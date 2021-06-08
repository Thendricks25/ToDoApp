import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/View%20Model/cross_off_Provider.dart';

class ListBlock extends StatefulWidget {
  ListBlock({this.id, this.item});
  final item;
  final id;
  @override
  _ListBlockState createState() => _ListBlockState();
}

class _ListBlockState extends State<ListBlock> {
  void _strikeIt(BuildContext context) {
    Provider.of<CrossOff>(context, listen: false).strikeThough();
  }

  @override
  Widget build(BuildContext context) {
    bool crossOff = Provider.of<CrossOff>(context).striker;
    return GestureDetector(
      onHorizontalDragStart: (details) {
        _strikeIt(context);
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
