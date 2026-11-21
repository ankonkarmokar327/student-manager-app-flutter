import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/read_get.dart';
import 'package:flutter_application_1/services/save_insert.dart';
import 'login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'add_student_screen.dart';

class interFace extends StatefulWidget {
  const interFace({super.key});

  @override
  State<interFace> createState() => _interFaceState();
}

class _interFaceState extends State<interFace> {
  ReadGet readGet = ReadGet();

  List<String> students = [];

  ///Create a function for loadStudents data
  Future<void> loadStudents() async {
    students = await readGet.getstudents();

    setState(() {});
  }

  /// Load saved students automatically when the screen opens
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        centerTitle: true,

        backgroundColor: Colors.blueAccent,

        title: const Text(
          "Student Manager",

          style: TextStyle(
            fontSize: 22,

            fontWeight: FontWeight.bold,

            color: Colors.white,

            letterSpacing: 1,
          ),
        ),

        leading: const Icon(Icons.school, color: Colors.white),

        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();

              await prefs.setBool("isLoggedIn", false);

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },

            icon: const Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),

      ///+ button-
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueAccent,

        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddStudentScreen()),
          );

          loadStudents();
        },

        icon: const Icon(Icons.add),

        label: const Text("Add"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(height: 20),

              Expanded(
                child: students.isEmpty
                    ? const Center(
                        child: Text(
                          "No Student Added Yet",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    : ListView.builder(
                        itemCount: students.length,

                        itemBuilder: (context, index) {
                          List<String> data = students[index].split("|");

                          return Card(
                            elevation: 5,

                            margin: const EdgeInsets.only(bottom: 12),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),

                            child: ListTile(
                              contentPadding: const EdgeInsets.all(12),

                              leading: const CircleAvatar(
                                radius: 28,

                                backgroundColor: Colors.blueAccent,

                                child: Icon(Icons.school, color: Colors.white),
                              ),

                              title: Text(
                                data[0],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),

                              subtitle: Text(
                                "Roll : ${data[1]}\n"
                                "Reg : ${data[2]}\n"
                                "Class : ${data[3]}",
                              ),

                              trailing: IconButton(
                                onPressed: () async {
                                  await readGet.deleteStudent(index);

                                  loadStudents();
                                },

                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
