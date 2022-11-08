import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dose_calculator_for_vets/di/di.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void initExternals() {
  di.registerLazySingleton(() => const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true)));
  di.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
}
