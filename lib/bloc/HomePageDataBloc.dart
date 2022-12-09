import 'dart:async';
import 'dart:io';

import 'package:hostbooks/networking/ApiProvider.dart';

class HomeDataBloc {
  late StreamController<dynamic> _streamController;

  HomeDataBloc() {
    _streamController = StreamController<dynamic>();
  }

  StreamSink<dynamic> get searchUserDataSink => _streamController.sink;

  Stream<dynamic> get searchUserDataStream => _streamController.stream;

  callSearchUser(searchUser) async {
    try {
      final response = await ApiProvider().getApi(searchUser);
      searchUserDataSink.add(response);
    } catch (e) {
      searchUserDataSink.add('error');
    }
  }

  dispose() {
    _streamController.close();
  }
}


/**
 * 
 * 
 *   Entry Point(sink) add searchUserDataSink  -------------------------------------------------------------------- Exit point(stream) listen -searchUserDataStream
 * 
 * 
 */