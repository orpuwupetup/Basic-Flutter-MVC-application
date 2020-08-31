import 'package:flutter/material.dart';
import 'package:flutter_mvc/data/repository.dart';
import 'package:flutter_mvc/widgets/ui/counter/counter_page_view.dart';
import 'package:provider/provider.dart';

class CounterPageController extends StatefulWidget {
  final Repository repository = Repository.getInstance;

  @override
  State createState() => _CounterPageControllerState();

  void incrementCounter() => repository.incrementCounter();
}

class _CounterPageControllerState extends State<CounterPageController>
    implements CounterPageViewActionsListener {

  @override
  Widget build(BuildContext context) => Consumer<Repository>(
        builder: (context, repository, _) {
          return CounterPageView(
            actionsListener: this,
            currentCount: repository.getCurrentClickCount(),
          );
        },
      );

  @override
  onFloatingButtonPressed() {
    widget.incrementCounter();
  }
}
