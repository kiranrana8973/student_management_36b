import 'package:flutter/material.dart';
import 'package:student_management_36b/model/student_model.dart';
import 'package:student_management_36b/views/output_view.dart';

class StudentView extends StatefulWidget {
  const StudentView({super.key});

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  StudentModel? studentModel;
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final ageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Student View')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,

            child: Column(
              children: [
                TextFormField(
                  controller: fnameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter first name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: lnameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter last name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter age';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle save action
                        setState(() {
                          studentModel = StudentModel(
                            fName: fnameController.text,
                            lName: lnameController.text,
                            age: int.parse(ageController.text),
                          );
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OutputView(studentModel: studentModel!),
                          ),
                        );
                      }
                    },
                    child: Text('Save'),
                  ),
                ),
                SizedBox(height: 16),

                // studentModel != null
                //     ? Text(
                //         'Saved Student: ${studentModel!.fName} ${studentModel!.lName}, Age: ${studentModel!.age}',
                //         style: TextStyle(
                //           fontSize: 16,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       )
                //     : Text(
                //         'No student saved',
                //         style: TextStyle(
                //           fontSize: 16,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
