import 'package:rxdart/rxdart.dart';
class BoolCheck
{
  final  _controller = PublishSubject<bool>();


  Stream<bool>  get boolValue => _controller.stream;

  void check(bool value)
  {
    _controller.sink.add(!value);
  }
}