import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRemoteDatasource {
  final _db = FirebaseFirestore.instance;

  Future<void> saveUser(User user) async {
    final ref = _db.collection('users').doc(user.uid);

    final snapshot = await ref.get();

    if (snapshot.exists) {
      await ref.update({
        'lastLoginAt' : Timestamp.now()
      });
    } else {
      await ref.set({
        'uid': user.uid,
        'name': user.displayName,
        'email': user.email,
        'photoUrl': user.photoURL,
        'createdAt': Timestamp.now(),
        'lastLoginAt': Timestamp.now()
      });
    }
  }

  Future<bool> isUserExists(String uid) async {
    final doc = await _db.collection('users').doc(uid).get();
    return doc.exists;
  }
}