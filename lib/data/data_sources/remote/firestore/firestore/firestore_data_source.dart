abstract class FirestoreDataSource {
  Future<void> init();
  List<String> generateSearchList(List<String> names);
}
