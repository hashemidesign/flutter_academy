import 'package:appwrite/appwrite.dart';

import '../model/course.model.dart';
import 'appwrite.service.dart';

class CourseService {
  final database = Databases(AppWriteService.instance.client);

  Future<List<Course>> getCourses() async {
    final docs = await database.listDocuments(
        databaseId: 'flutter_academy_db',
        collectionId: 'courses',
        queries: [
          Query.equal('status', 'published'),
        ]);
    return docs
        .convertTo((data) => Course.fromMap(Map<String, dynamic>.from(data)));
  }
}
