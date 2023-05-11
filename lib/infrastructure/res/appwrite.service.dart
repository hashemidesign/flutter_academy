import 'package:appwrite/appwrite.dart';

class AppWriteService {
  static AppWriteService instance = AppWriteService();
  final Client client;

  AppWriteService() : client = Client() {
    client
        .setEndpoint("http://10.0.2.2/v1")
        .setProject("645b1c1ece7d6d5b665a");
  }
}

final appWriteService = AppWriteService();
