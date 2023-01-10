import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_team/models/problems_model.dart';
import 'package:flutter_team/screens/student_screens/student_add_problem.dart';
import 'package:flutter_team/widgets/app_drawer.dart';
import 'package:flutter_team/widgets/student_problems.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentsHomeScreen extends StatefulWidget 
{
  const StudentsHomeScreen({super.key});

  @override
  State<StudentsHomeScreen> createState() => _StudentsHomeScreenState();
}

class _StudentsHomeScreenState extends State<StudentsHomeScreen> 
{  
  List<Problems> generalProb =[];
  List<Problems> acadimicProb =[];
  List<Problems> scheduleProb = [];

  String general_encodedData = '';


  @override
  void initState() 
  {
    // TODO: implement initState
    super.initState();

    _init();
  }

  _init() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? encodedData = await prefs.getString('general_Prob');
    if(encodedData != null) 
    {
      generalProb = Problems.decode(encodedData);
      setState(() {
        
      });
    }
  }

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
          actions: 
          [
            IconButton(onPressed: () 
            {
              _saveToJson();
              Navigator.pop(context);
            }, icon:  Icon(Icons.logout)),
          ],
          title: const Text('Student Home Page'),
          bottom: const TabBar
            (
              tabs: 
              [
                Tab(text: "General"),
                Tab(text: "Acadimic"),
                Tab(text: "Schedule"),
              ],
            ), 
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
                  Color.fromARGB(255, 210, 166, 199),
                  Color.fromARGB(148, 65, 108, 164),
                  Color.fromARGB(158, 193, 190, 162),
                  ]
              )
            ),
          )
        ),


        // drawer: AppDrawer(),


        body: TabBarView
        (
          children:
          [
            _generalList(),
            _acadimicList(),
            _scheduleList(),
          ],
        ),


        floatingActionButton: FloatingActionButton
        (
          onPressed: () 
          {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddingProblem(),)).then((value) 
            {
              inspect(value);
              if(value.kind == "General") 
              {
                generalProb.add(value);
              } 
              else if(value.kind == "Acadimic") 
              {
                acadimicProb.add(value);
              } 
              else 
              {
                scheduleProb.add(value);
              }
              
              setState(() {
                
              });
            });
          },
          backgroundColor: Colors.white,
          child: const Icon(Icons.add, color: Colors.blueAccent, size: 35,),
        ),
      ),
    );
  }
  
  Widget _generalList() 
  {
    return ListView.builder
    (
      itemCount: generalProb.length,
      itemBuilder:(context, index) 
      {
        return StudentProblems(problem: generalProb[index]);
      },
    );
  }


  Widget _acadimicList() 
  {
    return ListView.builder
    (
      itemCount: acadimicProb.length,
      itemBuilder:(context, index) 
      {
        return StudentProblems(problem: acadimicProb[index]);
      },
    );
  }


    Widget _scheduleList() 
    {
    return ListView.builder
    (
      itemCount: scheduleProb.length,
      itemBuilder:(context, index) 
      {
        return StudentProblems(problem: scheduleProb[index]);
      },
    );
  }
  
  Future<void> _saveToJson() async 
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    general_encodedData = Problems.encode
    (
      generalProb
    );
    await prefs.setString('general_Prob', general_encodedData);
  }
}