import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TreeNode {
  Key? key;
  bool isDirectory;
  String? path;
  String? content;
  List<TreeNode> children;

  TreeNode({
    this.key,
    this.isDirectory = false,
    this.path,
    this.content,
    this.children = const [],
  });

  @override
  String toString() {
    return "TreeNode, key:$key, isDirectory:$isDirectory, path:$path, content:$content, children:$children";
  }
}
