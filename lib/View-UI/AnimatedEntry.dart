import 'package:flutter/material.dart';
import 'List_Stream.dart';
import 'ListTile.dart';

Widget glide(BuildContext context, index, animation) {
  return ScaleTransition(scale: animation, child: ListBlock());
}

insertItem() {
  //itemBlocks.insert()
}
