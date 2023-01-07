import 'package:flutter/material.dart';
import 'package:flutter_team/models/problems_model.dart';

class StudentProblems extends StatefulWidget 
{
  const StudentProblems({super.key});

  @override
  State<StudentProblems> createState() => _StudentProblemsState();
}

class _StudentProblemsState extends State<StudentProblems> 
{
  List<Problems> problem = [];

  List<dynamic> general = [];
  List<dynamic> academic = [];
  List<dynamic> schedule = [];


  @override
  Widget build(BuildContext context) 
  {
    return ListView.builder
    (
      itemCount: Problems.dummyProblems.length,
      itemBuilder: (context, index) 
      {
        for(var i=0; i<problem.length; i++)
        {
          if(Problems.dummyProblems[index].kind == "General")
          {
            general.add(Problems.dummyProblems[index].kind);
          }
          else if (Problems.dummyProblems[index].kind == "Academic")
          {
            academic.add(Problems.dummyProblems[index].kind);
          }
          else if (Problems.dummyProblems[index].kind == "Schedule")
          {
            schedule.add(Problems.dummyProblems[index].kind);
          }
        }
        return 
        Card
        (
          margin: EdgeInsets.all(10),
          elevation: 7,
          shadowColor: Colors.black,
          color: Colors.blueAccent[90],
          shape: RoundedRectangleBorder
          (
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container
          (
            decoration: BoxDecoration
            (
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient
              (
                colors: 
                [
                  Color.fromARGB(255, 158, 228, 213),
                  Color.fromARGB(151, 60, 117, 192),
                  Color.fromARGB(158, 36, 22, 116),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20,right: 50, bottom: 0, left: 50),
              child: 
              Column
              (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
                [
                  Text(Problems.dummyProblems[index].student_name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),),
                  Text(Problems.dummyProblems[index].problem, style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.white),),
                  SizedBox(height: 20,),
                  Text(Problems.dummyProblems[index].admin_name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),),
                  Text(Problems.dummyProblems[index].answer, style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.white),),
                  SizedBox(height: 10,),
                  Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: 
                    [
                      Row
                      (
                        children: 
                        [
                          InkWell
                          (
                            child: Icon(Icons.arrow_drop_up, color: Colors.greenAccent, size: 50,),
                            onTap: () 
                            {
                              if(Problems.dummyProblems[index].downvote != 0)
                              {
                                Problems.dummyProblems[index].upvote++;
                                Problems.dummyProblems[index].downvote --;
                              }
                              else if (Problems.dummyProblems[index].downvote == 0)
                              {
                                Problems.dummyProblems[index].upvote ++;
                              }
                              setState(() 
                              {
                                
                              });
                            },
                          ),
                          Text("${Problems.dummyProblems[index].upvote}", style:TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.white),),
                        ],
                      ),
                      Row
                      (
                        children:
                        [
                          InkWell
                          (
                            child: Icon(Icons.arrow_drop_down, color: Colors.redAccent, size: 50,),
                            onTap: ()
                            {
                              if(Problems.dummyProblems[index].upvote != 0)
                              {
                                Problems.dummyProblems[index].downvote ++;
                                Problems.dummyProblems[index].upvote --;
                              }
                              else if (Problems.dummyProblems[index].upvote == 0)
                              {
                                Problems.dummyProblems[index].downvote ++;
                              }
                              
                              setState(() {
                                
                              });
                            },
                          ),
                          Text("${Problems.dummyProblems[index].downvote}", style:TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.white),),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}