import 'dart:async';
import 'dart:collection';

// history repository that stores list of items scanned
// uses a stream controller to notify the UI when a new item is added
// to the history

class HistoryRepository {
  final List<String> _history = [];

  UnmodifiableListView<String> get history => UnmodifiableListView(_history);

  final StreamController<String> _controller =
      StreamController<String>.broadcast();
  Stream<String> get historyStteam => _controller.stream;

  void historyAdd(String material, String code) {
    if (_controller.isClosed) return;
    print("adding to controller");
    _history.add("Material: $material - UPC Code: $code");
    _controller.add("Material: $material - UPC Code: $code");
  }

  void closeController() {
    if (_controller.isClosed) return;
    print("closing controller");
    _controller.addError("Stream closed");
    _controller.close();
  }

  void pauseController() {
    if (_controller.isPaused) return;
    print("pausing controller");
    _controller.onPause;
  }

  void resumeController() {
    if (_controller.isPaused) return;
    print("resuming controller");
    _controller.onResume;
  }

  void clearHistory() {
    _history.clear();
    _controller.add("History cleared");
  }
}
