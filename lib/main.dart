import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:flutterando/app/app_module.dart';
import 'package:flutterando/app/app_widget.dart';

Future<void> main() async {
  timeago.setLocaleMessages('pt_br', timeago.PtBrMessages());
  runApp(
    ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ),
  );
}
