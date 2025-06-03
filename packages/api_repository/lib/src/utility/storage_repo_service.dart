import 'package:storage_repository/storage_repository.dart';

StorageRepo storageRepo = StorageRepoService();

// String? token = 'Bearer 1b3a62a4-c82c-4a68-9fe9-58ac72dfd5c0';
String? token;
Future<String?> get userToken async {
  if (token != null) {
    return token;
  }
  return token = await storageRepo.getToken();
}
