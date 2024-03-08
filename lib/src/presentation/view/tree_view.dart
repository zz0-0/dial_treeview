import 'package:dial_treeview/src/domain/model/tree_node.dart';
import 'package:dial_treeview/src/presentation/widget/tree_node_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TreeView extends ConsumerStatefulWidget {
  const TreeView({
    super.key,
    required this.nodes,
    this.indent = 40,
    this.iconSize = 8,
  });

  final List<TreeNode> nodes;
  final double? indent;
  final double? iconSize;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TreeViewState();
}

class _TreeViewState extends ConsumerState<TreeView> {
  @override
  Widget build(BuildContext context) {
    return buildNodes(
      widget.nodes,
      widget.indent,
      widget.iconSize,
    );
  }
}
