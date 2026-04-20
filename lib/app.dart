import 'package:flutter/material.dart';
import 'package:student_management_36b/views/student_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: StudentView());
  }
}
