import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_bloc/CounterBLoC.dart';
import 'package:flutter_app_bloc/CounterEvent.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  final _bloc = CounterBLoC();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
      floatingActionButton: _getButton()
    );
  }

  @override
  dispose(){
    super.dispose();
    _bloc.dispose();
  }

  _getBody(){
    return StreamBuilder(
        stream: _bloc.stream_counter,
        initialData: 0,
        builder: (context, snapshot) {
          return Center(
            child: Text(snapshot.data.toString()),
          );
        }
    );
  }

  _getButton(){
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => _bloc.counter_event_sink.add(IncrementEvent()),
    );
  }

}
