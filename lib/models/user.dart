import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String image;
  final String name;
  final String username;
  final String amount;

  const User({
    required this.email,
    required this.uid,
    required this.image,
    required this.username,
    required this.amount,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'image': image,
        'amount': amount,
        'name': name,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      image: snapshot['image'],
      amount: snapshot['amount'],
      name: snapshot['name'],
    );
  }
}
