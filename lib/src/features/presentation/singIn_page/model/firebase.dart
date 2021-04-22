import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addUser(String userEmail, String userPassword) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  users.add({'userEmail': userEmail, 'userPassword': userPassword});
  return;
}
//Este codigo funciona
/*
Future<void> addUser(String userEmail, String userPassword) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  users.add({'userEmail': userEmail, 'userPassword': userPassword});
  return;
}
*/
