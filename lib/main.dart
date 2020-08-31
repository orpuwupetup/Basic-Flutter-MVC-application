import 'package:flutter/material.dart';
import 'package:flutter_mvc/data/repository.dart';
import 'package:flutter_mvc/widgets/main/mvc/my_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<Repository>(
      create: (context) => Repository.getInstance,
      child: MyApp(),
    )
  );
}