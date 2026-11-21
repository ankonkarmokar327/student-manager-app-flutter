import 'package:shared_preferences/shared_preferences.dart';

class ReadGet {
  Future<List<String>> getstudents() async {
    ///SharedPreferences open
    SharedPreferences prefs = await SharedPreferences.getInstance();

    ///return
    return prefs.getStringList("students") ?? [];
  }

  Future<void> deleteStudent(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> students = prefs.getStringList("students") ?? [];

    students.removeAt(index);

    await prefs.setStringList("students", students);
  }
}
