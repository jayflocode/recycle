import 'dart:async';
import 'dart:collection';

class HistoryRepository {
  final List<String> _history = [];
  // change to your type
  UnmodifiableListView<String> get history => UnmodifiableListView(
    _history,
  ); // just to restrict adding items only from this class.
  final StreamController<String> _controller =
      StreamController<String>.broadcast();
  Stream<String> get historyStteam => _controller.stream;

  void historyAdd(String material, String code) {
    if (_controller.isClosed) return;
    print("adding to controller");
    _history.add("Material: $material - UPC Code: $code");
    _controller.add("Material: $material - UPC Code: $code");
  }
}
