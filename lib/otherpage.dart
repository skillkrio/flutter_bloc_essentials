import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OtherPage"),
      ),
      body: const Center(
        child: Text(
          "Other Page",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
