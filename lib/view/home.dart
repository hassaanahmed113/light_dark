import 'package:flutter/material.dart';
import 'package:light_dark_/view/controller.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvide = Provider.of<HomeProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: ElevatedButton(
            onPressed: () {
              homeProvide.toggleTheme();
            },
            child: const Text('Change')),
      ),
    );
  }
}
