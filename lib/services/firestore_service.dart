import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  FirestoreService._();

  static final FirestoreService firestoreService = FirestoreService._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addData(
      {required String name,
      required String email,
      required int number,
      required String address}) {
    Map<String, dynamic> data = {
      "Name": name,
      "Email": email,
      "Number": number,
      "Address": address,
    };
    firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("resumes")
        .doc()
        .set(data);
  }
}
