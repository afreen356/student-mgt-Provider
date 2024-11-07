import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/provider/student_controller.dart';


class Profile extends StatelessWidget {
  final int? studentId;
  const Profile({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
      final student =
        Provider.of<StudentController>(context).getStudentById(studentId);
      if (student == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text("Profile", style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        body: const Center(
          child: Text("Student not found",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
      );
    }

       

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text("Profile", style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
         
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child:  Container(
                height: 150,
                width: 150,
                color: Colors.grey.withOpacity(0.5),
                child: student.image.isNotEmpty && File(student.image).existsSync()
                  ? Image.file(
                      File(student.image),
                      fit: BoxFit.cover,
                    )
                  : const Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.white,
                    ),
              ),
            ),
              const SizedBox(height: 20),
              Text(
                'Name :${student.name}'
                ,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'class:${
                student.classs}',
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text('adm No:${
                student.admissionNumber}',
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text('Address:${
                student.address}',
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ],
          ),
        ),
      );
    }
  }
