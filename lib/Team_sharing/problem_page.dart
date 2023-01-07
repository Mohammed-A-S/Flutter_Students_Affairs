import 'package:flutter/material.dart';
import 'package:flutter_team/models/problems_model.dart';
import 'add_problem.dart';

class AddingPage extends StatefulWidget 
{
  AddingPage(
    {
      this.student_name = '', 
      this.student_id = '', 
      this.student_level = '', 
      this.department = '', 
      this.problem = '', 
      
      this.admin_name = '', 
      this.admin_id = '', 
      this.answer = '',

      this.upvote = 0, 
      this.downvote = 0, 

      this.kind = '', 
      
      Key? key
    }) 
    : 
    super(key: key);


  String student_name;
  String student_id;
  String student_level;
  String department;
  String problem;

  String admin_name;
  String admin_id;
  String answer;

  int upvote;
  int downvote;

  String kind;



  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> 
{
  String get student_name => widget.student_name;
  String get student_id => widget.student_id;
  String get student_level => widget.student_level;
  String get department => widget.department;
  String get problem => widget.problem;

  String get admin_name => widget.admin_name;
  String get admin_id => widget.admin_id;
  String get answer => widget.answer;

  int get upvote => widget.upvote;
  int get downvote => widget.downvote;

  String get kind => widget.kind;



  TextEditingController student_nameController = TextEditingController();
  TextEditingController student_idController = TextEditingController();
  TextEditingController student_levelController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController problemController = TextEditingController();

  @override
  void initState() 
  {
    super.initState();

    student_nameController.text = student_name;
    student_idController.text = student_id;
    student_levelController.text = student_level;
    departmentController.text = department;
    problemController.text = problem;
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add problem'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
              TextField
              (
                controller: student_idController,
                decoration: const InputDecoration
                (
                  border: OutlineInputBorder(),
                  labelText: 'Student ID',
                ),
              ),TextField
              (
                controller: student_levelController,
                decoration: const InputDecoration
                (
                  border: OutlineInputBorder(),
                  labelText: 'Student Level',
                ),
              ),
              TextField
              (
                controller: departmentController,
                decoration: const InputDecoration
                (
                  border: OutlineInputBorder(),
                  labelText: 'Student Department',
                ),
              ),TextField
              (
                controller: problemController,
                decoration: const InputDecoration
                (
                  border: OutlineInputBorder(),
                  labelText: 'Enter Your Problem Here',
                ),
              ),
              ElevatedButton
              (
                onPressed: () 
                {
                  if (student_nameController.text.isEmpty || student_idController.text.isEmpty || student_levelController.text.isEmpty || departmentController.text.isEmpty || problemController.text.isEmpty) 
                  {
                    _showError();
                  } 
                  else 
                  {
                    //Navigator.pop(context,Problems(student_name: student_nameController, student_id: student_idController,student_level: student_levelController,department: departmentController,problem: problemController, admin_name: '', admin_id: '', answer: '', upvote: 0, downvote: 0, kind: ""),);
                  }
                },
                child: const Text('Add problem'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showError() 
  {
    const snackBar = SnackBar
    (
      content: Text('Please enter title and description'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
