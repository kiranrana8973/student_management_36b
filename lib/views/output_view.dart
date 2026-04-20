import 'package:flutter/material.dart';
import 'package:student_management_36b/model/student_model.dart';

class OutputView extends StatelessWidget {
  final StudentModel studentModel;
  const OutputView({super.key, required this.studentModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Output")),
      body: Text(
        'Saved Student: ${studentModel.fName} ${studentModel.lName}, Age: ${studentModel.age}',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
