import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_app/services/firestore_service.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Contact Information"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Name"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Email"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Phone"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  label: Text("Address"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        FirestoreService.firestoreService.addData(
                            name: nameController.text,
                            email: emailController.text,
                            number: int.parse(phoneController.text),
                            address: addressController.text);
                      },
                      child: const Text("Add")),
                  ElevatedButton(
                      onPressed: () {
                        showAdaptiveDialog(
                          context: context,
                          builder: (context) => StreamBuilder(
                              stream: FirestoreService
                                  .firestoreService.firestore
                                  .collection("users")
                                  .doc(FirebaseAuth.instance.currentUser!.email)
                                  .collection("resumes")
                                  .doc()
                                  .snapshots(),
                              builder: (context, snapshot) {
                                return AlertDialog(
                                  title: Text("Update"),
                                  actions: [
                                    TextFormField(
                                      initialValue: snapshot.data!.data()!["Name"],
                                    ),
                                  ],
                                );
                              }),
                        );
                      },
                      child: const Text("Update")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
