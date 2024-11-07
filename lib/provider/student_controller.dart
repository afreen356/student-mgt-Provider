
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_management_provider/model/db_model.dart';


const studentDb ='students';

class StudentController extends ChangeNotifier {
  List<Student> students =[];
  List<Student> results =[];


  StudentController(){
   getStudents();
  }

  getStudents() async{
    final box = await Hive.openBox<Student>(studentDb);
    students = box.values.toList();
    results = box.values.toList();
    notifyListeners();
  }

  
  postStudent(Student data) async {
    final box = await Hive.openBox<Student>(studentDb);
   int id = await box.add(data);
   data.id = id;
   await box.put(id, data);
    students = box.values.toList();
    results=students;
    notifyListeners(); 
    
  }
  Future<void> updateStudent(Student data,int? id)async{
     final box = await Hive.openBox<Student>(studentDb);
   await box.put(id, data);
   students = box.values.toList();
    results=students;
    notifyListeners(); 
  }
 Student? getStudentById(int? id) {
   return students.firstWhere((student)=> student.key == id);
  }
  

  deleteStudent(int? id,) async {
     final box = await Hive.openBox<Student>(studentDb);
    await  box.delete(id);
    students = box.values.toList();
    results = students;
    notifyListeners();
   
   
  }

  
  search(String query) {
    if (query.isEmpty) {
      results = students;
    } else {
      results = students
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}