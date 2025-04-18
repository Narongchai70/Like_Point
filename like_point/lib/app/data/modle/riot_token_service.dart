import 'package:cloud_firestore/cloud_firestore.dart';

class RiotTokenService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<String?> getToken() async {
    try {
      final doc = await _firestore.collection('token').doc('token').get();

      if (doc.exists) {
        return doc.data()?['token'] as String?;
      } else {
        print('riot_token document not found in Firestore');
        return null;
      }
    } catch (e) {
      print('Failed to fetch Riot Token: $e');
      return null;
    }
  }
}
