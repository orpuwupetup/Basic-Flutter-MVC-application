import 'package:flutter/material.dart';
import 'package:flutter_mvc/generated/i18n.dart';

class Strings {
  BuildContext _appContext;

  Strings._privateConstructor();

  static final Strings _instance = Strings._privateConstructor();

  static Strings get getInstance => _instance;

  static S get get => S.of(_instance._appContext);

  init({BuildContext context}) {
    _appContext = context;
  }
}