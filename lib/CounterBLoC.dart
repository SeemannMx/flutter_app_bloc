import 'dart:async';

import 'package:flutter_app_bloc/CounterEvent.dart';

class CounterBLoC{

  int _counter = 0;

  // init and get StreamController
  final _counterStreamController = StreamController<int>();
  StreamSink<int> get counter_sink => _counterStreamController.sink;

  // expose data from stream
  Stream<int> get stream_counter => _counterStreamController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  // expose sink for input events
  Sink <CounterEvent> get counter_event_sink => _counterEventController.sink;

  CounterBLoC() {  _counterEventController.stream.listen(_count);  }


  _count(CounterEvent event) => counter_sink.add(++_counter);

  dispose(){
    _counterStreamController.close();
    _counterEventController.close();
  }
}