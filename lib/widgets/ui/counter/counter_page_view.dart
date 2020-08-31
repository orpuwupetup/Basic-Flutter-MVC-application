import 'package:flutter/material.dart';
import 'package:flutter_mvc/res/strings.dart';

class CounterPageView extends StatelessWidget {

  final int currentCount;
  final CounterPageViewActionsListener actionsListener;

  CounterPageView({this.actionsListener, this.currentCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.get.appTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$currentCount',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: actionsListener?.onFloatingButtonPressed,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

abstract class CounterPageViewActionsListener {
  onFloatingButtonPressed();
}
