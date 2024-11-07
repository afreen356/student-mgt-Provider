
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:student_management_provider/provider/student_controller.dart';
import 'package:student_management_provider/screens/view.dart';


class SearchStudent extends StatelessWidget {
 const SearchStudent({super.key});

@override
  Widget build(BuildContext context) {
       final searchController = TextEditingController();   
    return SafeArea(
      child: Scaffold(
        body: Consumer<StudentController>(
          builder:(context,studentModel,child)=>
           Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) => studentModel.search(value),
                  decoration: InputDecoration(
                    hintText: "Search...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              
                 Expanded(
                  child: studentModel.results.isEmpty
                      ? const Center(
                          child: Text("No Student Found"),
                        )
                      : ListView.builder(
                          itemCount: studentModel.results.length,
                          itemBuilder: (context, index) => Card(
                            child: GestureDetector(
                              onTap: (){
                               Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => Profile(
                                            studentId: studentModel
                                                .results[index].key)));
                              },
                              child: ListTile(
                                
                                title: Text(studentModel.results[index].name),
                              ),
                            ),
                          ),
                        ),
                ),
            ]
              )
            
          ),
        ),
      );
    
  }
}