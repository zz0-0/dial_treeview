import 'package:dial_treeview/src/domain/model/tree_node.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TreeNodeWidget extends ConsumerStatefulWidget {
  const TreeNodeWidget({
    super.key,
    required this.node,
    required this.indent,
  });
  final double indent;
  final TreeNode node;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TreeNodeWidgetState();
}

class _TreeNodeWidgetState extends ConsumerState<TreeNodeWidget> {
  @override
  Widget build(BuildContext context) {
    var icon = isLeaf(widget.node)
        ? null
        : isExpanded()
            ? const Icon(Icons.expand_more)
            : const Icon(Icons.chevron_right);

    return Column(
      children: [
        Row(
          children: [
            IconButton(onPressed: onPressed, icon: icon!),
            widget.node.content!,
          ],
        ),
        if (!isLeaf(widget.node))
          Padding(
            padding: EdgeInsets.only(
              left: widget.indent,
            ),
            // child: ,
          ),
      ],
    );
  }

  bool isLeaf(TreeNode node) {
    return node.children.isEmpty;
  }

  bool isExpanded() {
    return false;
  }

  void onPressed() {}
}
