import 'package:dial_treeview/src/domain/model/tree_node.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TreeView extends ConsumerStatefulWidget {
  const TreeView(this.nodes, this.indent, this.iconSize, {super.key});

  final List<TreeNode> nodes;
  final double? indent;
  final double? iconSize;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TreeViewState();
}

class _TreeViewState extends ConsumerState<TreeView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
