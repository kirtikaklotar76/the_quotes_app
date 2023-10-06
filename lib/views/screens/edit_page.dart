import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Quote"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Form(child: Column(),),
      ),
    );
  }
}
