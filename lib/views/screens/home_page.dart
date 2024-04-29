import 'package:flutter/material.dart';

import '../../utils/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resumes"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context,Routes.optionsPage);
        },
        label: const Text("Add Resume"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
