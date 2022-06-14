

import 'package:countertask/src/models/api_model.dart';
import 'package:countertask/src/provider/api_provider.dart';
import 'package:rxdart/rxdart.dart';

class ApiBloc{

  final _controller = BehaviorSubject<List<ApiModel>>();

  Stream<List<ApiModel>> get apidata => _controller.stream;

  Future<List<ApiModel>> getData() async
  {
    final List<ApiModel> item = await ApiProvider().gridData();
    _controller.sink.add(item);
     return item;
  }
}