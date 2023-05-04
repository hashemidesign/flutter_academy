import 'package:riverpod/riverpod.dart';

import '../../infrastructure/res/course.service.dart';
import 'course.vm.dart';

class CourseListVM extends StateNotifier<List<CourseVM>> {
  final CourseService service;

  CourseListVM(this.service) : super(const []) {
    fetchCourses();
  }

  Future<void> fetchCourses() async {
    final res = await CourseService().getCourses();
    state = [...res.map((course) => CourseVM(course))];
  }
}

final courseListVM = StateNotifierProvider<CourseListVM, List<CourseVM>>(
    (ref) => CourseListVM(CourseService()));
