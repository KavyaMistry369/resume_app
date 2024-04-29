import 'package:flutter/material.dart';

class Experiences extends StatelessWidget {
  const Experiences({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController companyController = TextEditingController();
    TextEditingController roleController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Experiences"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: companyController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Company"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: roleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Role"),
              ),
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
