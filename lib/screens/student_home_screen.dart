import 'package:flutter/material.dart';
import 'package:flutter_team/widgets/app_drawer.dart';
import 'package:flutter_team/widgets/student_problems.dart';

class StudentsHomeScreen extends StatefulWidget 
{
  const StudentsHomeScreen({super.key});

  @override
  State<StudentsHomeScreen> createState() => _StudentsHomeScreenState();
}

class _StudentsHomeScreenState extends State<StudentsHomeScreen> 
{  
  @override
  Widget build(BuildContext context) 
  {
    // var problems = Problems(student_name, Problem, Admin_name, Answer, upvote, downvote)
    return DefaultTabController
    (
      length: 3,
      child: Scaffold
      (
        appBar: AppBar
        (
          title: const Text('Student Problems Page'),
          centerTitle: true,
          bottom: const TabBar
          (
            tabs: 
            [
              Tab(text: "General"),
              Tab(text: "Acadimic"),
              Tab(text: "Schedule"),
            ],
          ), 
        ),


        drawer: const AppDrawer(),


        body: TabBarView
        (
          children:
          [
            const StudentProblems(),
            Column(),
            Column(),
          ],
        ),
      ),
    );
  }
}