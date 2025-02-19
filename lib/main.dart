import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/views/mobile/mobile.dart';

void main() {
  runApp(ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "app",
      debugShowCheckedModeBanner: false,
      home: Task(),
    );
  }
}

class Task extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return Container();
      } else {
        return Mobile();
      }
    });
  }
}
