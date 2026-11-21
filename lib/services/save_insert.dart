import 'package:shared_preferences/shared_preferences.dart';

class SaveInsert {
  Future<void> savestudent(
    String name,
    String roll,
    String reg,
    String studentclass,
  ) async{
    /// SharedPreferences open
    SharedPreferences prefs= await SharedPreferences.getInstance();
    /// studentslist--
    List<String> students =prefs.getStringList("students")??[];
    ///studentadd-
    students.add("$name|$roll|$reg|$studentclass");
    ///studentsave--
    await prefs.setStringList("students", students);

  }
}