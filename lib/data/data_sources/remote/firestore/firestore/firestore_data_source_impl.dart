import 'package:firebase_core/firebase_core.dart';

import 'firestore_data_source.dart';

class FirestoreDataSourceImpl implements FirestoreDataSource {
  @override
  Future<void> init() async {
    await Firebase.initializeApp();
  }

  @override
  List<String> generateSearchList(List<String> names) {
    List<String> result = [];

    for (var name in names) {
      for (int i = 1; i < name.length; i++) {
        result.add(name.substring(0, i).toLowerCase());
      }
    }
    return result;
  }
}
