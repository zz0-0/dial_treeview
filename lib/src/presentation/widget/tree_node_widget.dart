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
        ? const Icon(Icons.abc)
        : isExpanded(widget.key!)
            ? const Icon(Icons.expand_more)
            : const Icon(Icons.chevron_right);

    return Column(
      children: [
        Row(
          children: [
            if (isLeaf(widget.node))
              icon
            else
              IconButton(onPressed: onPressed, icon: icon),
            // widget.node.content!,
            Flexible(
              child: Text(
                widget.node.content!,
                style: const TextStyle(fontSize: 8),
              ),
            ),
          ],
        ),
        if (isExpanded(widget.key!) && !isLeaf(widget.node))
          Padding(
            padding: EdgeInsets.only(
              left: widget.indent,
            ),
            child: buildNode(
              widget.node,
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

Widget buildNode(TreeNode node, double? indent, double? iconSize) {
  return TreeNodeWidget(
    key: node.key,
    node: node,
    indent: indent!,
    iconSize: iconSize!,
  );
}
