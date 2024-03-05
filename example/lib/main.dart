import 'package:dial_treeview/dial_treeview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TreeView(
        key: Key("value0"),
        nodes: [
          TreeNode(
            key: Key("value"),
            children: [
              TreeNode(
                key: Key("value1"),
                children: [],
                content: const Text("data1"),
              ),
            ],
            content: const Text("data"),
          ),
        ],
      ),
    );
  }
}
