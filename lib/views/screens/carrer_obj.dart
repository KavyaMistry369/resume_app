import 'package:flutter/material.dart';

class CarrerObjective extends StatelessWidget {
  const CarrerObjective({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController descController = TextEditingController();
    TextEditingController roleController = TextEditingController();

    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Carrer Objective"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller:descController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("description"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: roleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("role"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text("Add")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
