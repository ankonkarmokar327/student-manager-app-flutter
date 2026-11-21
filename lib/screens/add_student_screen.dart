import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/save_insert.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  ///Name input
  TextEditingController namecontroller = TextEditingController();

  ///Roll input
  TextEditingController rollcontroller = TextEditingController();

  ///Registration input
  TextEditingController regcontroller = TextEditingController();

  /// Studentclass input
  TextEditingController studentclassController = TextEditingController();

  /// Save Object
  SaveInsert saveInsert = SaveInsert();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        backgroundColor: Colors.blueAccent,

        title: const Text(
          "Add Student",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 40,

              backgroundColor: Colors.blueAccent,

              child: Icon(Icons.school, color: Colors.white, size: 40),
            ),

            const SizedBox(height: 15),

            const Text(
              "Student Information",

              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                labelText: "Student Name",

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: rollcontroller,

              decoration: InputDecoration(
                labelText: "Student Roll",

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: regcontroller,

              decoration: InputDecoration(
                labelText: "Student Registration",

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: studentclassController,

              decoration: InputDecoration(
                labelText: "Student Class",

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,

              height: 55,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                onPressed: () async {
                  if (namecontroller.text.isEmpty ||
                      rollcontroller.text.isEmpty ||
                      regcontroller.text.isEmpty ||
                      studentclassController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please fill all fields")),
                    );

                    return;
                  }

                  await saveInsert.savestudent(
                    namecontroller.text,

                    rollcontroller.text,

                    regcontroller.text,

                    studentclassController.text,
                  );

                  Navigator.pop(context);
                },

                child: const Text(
                  "SAVE STUDENT",

                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
