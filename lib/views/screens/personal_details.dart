import 'package:flutter/material.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController dobController = TextEditingController();
    TextEditingController nationalityController = TextEditingController();
    TextEditingController languagesController = TextEditingController();


    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Personal Details"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: dobController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("DOB"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: languagesController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Languages"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: nationalityController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Nationality"),
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
