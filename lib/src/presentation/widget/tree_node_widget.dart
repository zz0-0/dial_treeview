import 'package:dial_treeview/src/domain/model/tree_node.dart';
import 'package:dial_treeview/src/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TreeNodeWidget extends ConsumerStatefulWidget {
  const TreeNodeWidget({
    super.key,
    required this.node,
    required this.indent,
    required this.iconSize,
  });
  final double indent;
  final double iconSize;
  final TreeNode node;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TreeNodeWidgetState();
}

class _TreeNodeWidgetState extends ConsumerState<TreeNodeWidget> {
  @override
  Widget build(BuildContext context) {
    final icon = isLeaf(widget.node)
        ? null
        : isExpanded(widget.key!)
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
        if (isExpanded(widget.key!) && !isLeaf(widget.node))
          Padding(
            padding: EdgeInsets.only(
              left: widget.indent,
            ),
            child: buildNodes(
              widget.node.children,
              widget.indent,
              widget.iconSize,
            ),
          ),
      ],
    );
  }

  bool isLeaf(TreeNode node) {
    return node.children.isEmpty;
  }

  bool isExpanded(Key key) {
    return ref.watch(nodeExpandedProvider(key));
  }

  void onPressed() {
    ref.read(nodeExpandedProvider(widget.key!).notifier).update((state) {
      if (state) {
        return false;
      } else {
        return true;
      }
    });
  }
}

Widget buildNodes(Iterable<TreeNode> nodes, double? indent, double? iconSize) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for (final node in nodes)
        TreeNodeWidget(
          node: node,
          indent: indent!,
          iconSize: iconSize!,
        )
    ],
  );
}
