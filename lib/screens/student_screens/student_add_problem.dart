import 'package:flutter/material.dart';
import 'package:flutter_team/models/problems_model.dart';

class AddingProblem extends StatefulWidget 
{
  AddingProblem({Key? key}) : super(key: key);

  @override
  State<AddingProblem> createState() => _AddingProblemState();
}

class _AddingProblemState extends State<AddingProblem> 
{
  List<Problems> prb= [];
  List<String> kinds = ["General", "Acadimic", "Schedule"];
  String? mainKind = "General";


  void _showError() 
  {
    const snackBar = SnackBar
    (
      content: Text('Please enter title and description'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  TextEditingController student_nameController = TextEditingController();
  TextEditingController student_idController = TextEditingController();
  TextEditingController student_levelController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController problemController = TextEditingController();

  @override

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add problem'),
        flexibleSpace: Container
        (
          decoration: const BoxDecoration
          (
            gradient: LinearGradient
            (
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>
              [
              Color.fromARGB(255, 247, 207, 237),
              Color.fromARGB(149, 92, 143, 211),
              Color.fromARGB(158, 227, 226, 214),
              ]
            )
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                //StudentProms(),
                TextField
                (
                  controller: student_nameController,
                  decoration: const InputDecoration
                  (
                    border: OutlineInputBorder(),
                    labelText: 'Student Name',
                  ),
                ),
                SizedBox(height: 10,),
                TextField
                (
                  controller: student_idController,
                  decoration: const InputDecoration
                  (
                    border: OutlineInputBorder(),
                    labelText: 'Student ID',
                  ),
                ),
                SizedBox(height: 10,),
                TextField
                (
                  controller: student_levelController,
                  decoration: const InputDecoration
                  (
                    border: OutlineInputBorder(),
                    labelText: 'Student Level',
                  ),
                ),
                SizedBox(height: 10,),
                TextField
                (
                  controller: departmentController,
                  decoration: const InputDecoration
                  (
                    border: OutlineInputBorder(),
                    labelText: 'Student Department',
                  ),
                ),
                SizedBox(height: 10,),
                TextField
                (
                  controller: problemController,
                  decoration: const InputDecoration
                  (
                    border: OutlineInputBorder(),
                    labelText: 'Enter Your Problem Here',
                  ),
                ),
                SizedBox(height: 10,),
                DropdownButtonFormField
                (
                  value: mainKind,
                  items: kinds
                  .map
                  (
                    (item) => DropdownMenuItem
                    (
                      value: item,
                      child: Text(item, style: const TextStyle(fontSize: 20))
                    )
                  )
                  .toList(),
                  onChanged: (item) => setState(() => mainKind = item)
                ),
                ElevatedButton
                (
                  onPressed: () 
                  {
                    if (student_nameController.text.isEmpty || student_idController.text.isEmpty || 
                        student_levelController.text.isEmpty || departmentController.text.isEmpty || problemController.text.isEmpty) 
                    {
                      _showError();
                    } 
                    else 
                    {
                      Navigator.pop(context, Problems(advisor_id: '', advisor_name: '', answer: '', 
                      department: departmentController.text, downvote: 0, kind: mainKind!, 
                      problem: problemController.text, student_id: student_idController.text, student_level: 
                      student_levelController.text, student_name: student_nameController.text, upvote: 0));
                    }
                  },
                  child: const Text('Add problem'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}