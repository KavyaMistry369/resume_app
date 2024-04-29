import 'package:flutter/material.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController courseController = TextEditingController();
    TextEditingController collegeController = TextEditingController();
    TextEditingController gradeController = TextEditingController();
    TextEditingController passYearController = TextEditingController();

    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Education"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: courseController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Course"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: collegeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("College"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: gradeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Percentage"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: passYearController,
              decoration: InputDecoration(
                label: Text("Passing Year"),
                border: OutlineInputBorder(),
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
