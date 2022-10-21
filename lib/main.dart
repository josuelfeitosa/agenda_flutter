import 'package:crud_agenda/app/injection.dart';
import 'package:crud_agenda/app/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  setupInjection();
  runApp(const MyApp());
}
