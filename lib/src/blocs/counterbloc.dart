import 'package:rxdart/rxdart.dart';


class CounterBloc{

  final _controller = PublishSubject<int>();

  Stream<int> get increamentStream => _controller.stream;

  void increamentSink(int value) {
    _controller.sink.add(value++);
  }

  void decrementSink(int value) {
    _controller.sink.add(value--);
  }

  void dispose() {
    _controller.close();
  }

}

