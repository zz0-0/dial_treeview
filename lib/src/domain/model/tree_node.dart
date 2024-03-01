import 'package:flutter/material.dart';

class TreeNode {
  Key? key;
  List<TreeNode> children = [];
  Widget? content;

  TreeNode({this.key, this.content, required this.children});
}
