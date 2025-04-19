import 'package:cloud_firestore/cloud_firestore.dart';

class RiotTokenService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<String?> getToken() async {
    try {
      final doc = await _firestore.collection('token').doc('token').get();

      if (doc.exists) {
        return doc.data()?['token'] as String?;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
