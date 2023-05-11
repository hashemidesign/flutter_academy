import 'package:flutter_academy/app/view_models/course.vm.dart';
import 'package:flutter_academy/infrastructure/model/course.model.dart';
import 'package:flutter_academy/infrastructure/res/watchlist.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WatchlistVM extends StateNotifier<List<CourseVM>> {
  WatchlistService _watchlistService;

  WatchlistVM(this._watchlistService) : super(const []) {
    getWatchlist();
  }

  Future<void> addToWatchlist(int id, Course course) async {
    await _watchlistService.addToWatchlist(id, course.toMap());
    state = [CourseVM(course), ...state];
  }

  Future<void> removeFromWatchlist(int id) async {
    await _watchlistService.removeFromWatchlist(id);
    state = state.where((course) => course.course.id != id).toList();
  }

  Future<void> getWatchlist() async {
    final watchlist = await _watchlistService.getWatchlist();
    state = [...watchlist.map((e) => CourseVM(Course.fromMap(e)))];
  }

  bool isInWatchlist(int id) {
    return state.where((element) => element.course.id == id).isNotEmpty;
  }
}

final watchlistVM = StateNotifierProvider<WatchlistVM, List<CourseVM>>(
    (_) => WatchlistVM(WatchlistService.instance));
