import 'dart:io';

import 'package:dial_treeview/src/domain/model/tree_node.dart';
import 'package:dial_treeview/src/presentation/widget/tree_node_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TreeView extends ConsumerStatefulWidget {
  const TreeView({
    super.key,
    required this.entities,
    required this.currentDirectory,
    this.indent = 40,
    this.iconSize = 8,
  });

  final List<FileSystemEntity> entities;
  final Directory currentDirectory;
  final double? indent;
  final double? iconSize;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TreeViewState();
}

class _TreeViewState extends ConsumerState<TreeView> {
  @override
  Widget build(BuildContext context) {
    final List<TreeNode> nodes = parseFileSystemEntity(widget.entities);

    return ListView.builder(
      clipBehavior: Clip.antiAlias,
      shrinkWrap: true,
      itemCount: nodes.length,
      itemBuilder: (context, index) {
        return buildNode(nodes[index], widget.indent, widget.iconSize);
      },
    );
  }

  List<TreeNode> parseFileSystemEntity(List<FileSystemEntity> entities) {
    final rootNode = <TreeNode>[];
    var uniquePaths = <String>{};
    for (final entity in entities) {
      if (entity is Directory) {
        final children = parseFileSystemEntity(entity.listSync());
        final segments = entity.uri.pathSegments;
        final content = segments[segments.length - 2];
        final currentNode = TreeNode(
          key: Key(content),
          isDirectory: true,
          path: entity.path,
          content: content,
          children: children,
        );
        uniquePaths.add(entity.path);
        rootNode.add(currentNode);
      } else {
        if (!uniquePaths.contains(entity.path)) {
          uniquePaths.add(entity.path);
          final segments = entity.uri.pathSegments;
          final content = segments.last;
          // if (widget.currentDirectory.uri.pathSegments.last == parent) {
          final currentNode = TreeNode(
            key: Key(content),
            isDirectory: true,
            path: entity.path,
            content: content,
          );
          rootNode.add(currentNode);
        }

        // }
      }
    }
    return rootNode;
  }
}
