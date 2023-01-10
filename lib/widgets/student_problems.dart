import 'package:flutter/material.dart';
import 'package:flutter_team/models/problems_model.dart';

class StudentProblems extends StatefulWidget 
{
  StudentProblems({required this.problem, super.key});
  Problems problem;

  @override
  State<StudentProblems> createState() => _StudentProblemsState();
}

class _StudentProblemsState extends State<StudentProblems> 
{
  Problems get problem => widget.problem;


  @override
  Widget build(BuildContext context) 
  {
    return Card
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
                  Color.fromARGB(255, 247, 207, 237),
                  Color.fromARGB(149, 92, 143, 211),
                  Color.fromARGB(158, 227, 226, 214),
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
                  Text(problem.student_id, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),),
                  Text(problem.problem, style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.white),),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: 
                    [
                      Text(problem.advisor_name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),),
                      Text(problem.advisor_id, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 243, 243, 243)),),
                    ],
                  ),
                  Text(problem.answer, style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.white),),
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
                              if(problem.downvote != 0)
                              {
                                problem.upvote++;
                                problem.downvote --;
                              }
                              else if (problem.downvote == 0)
                              {
                                problem.upvote ++;
                              }
                              setState(() 
                              {
                                
                              });
                            },
                          ),
                          Text("${problem.upvote}", style:TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.white),),
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
                              if(problem.upvote != 0)
                              {
                                problem.downvote ++;
                                problem.upvote --;
                              }
                              else if (problem.upvote == 0)
                              {
                                problem.downvote ++;
                              }
                              
                              setState(() {
                                
                              });
                            },
                          ),
                          Text("${problem.downvote}", style:TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.white),),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
    /*
    return ListView.builder
    (
      itemCount: Problems.dummyProblems.length,
      itemBuilder: (context, index) 
      {
        for(var i=0; i<problem.length; i++)
        {
          if(problem.kind == "General")
          {
            general.add(problem);
          }
          else if (problem.kind == "Academic")
          {
            academic.add(problem);
          }
          else if (problem.kind == "Schedule")
          {
            schedule.add(problem);
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
                  Text(problem.student_name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),),
                  Text(problem.problem, style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.white),),
                  SizedBox(height: 20,),
                  Text(problem.admin_name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),),
                  Text(problem.answer, style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.white),),
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
                              if(problem.downvote != 0)
                              {
                                problem.upvote++;
                                problem.downvote --;
                              }
                              else if (problem.downvote == 0)
                              {
                                problem.upvote ++;
                              }
                              setState(() 
                              {
                                
                              });
                            },
                          ),
                          Text("${problem.upvote}", style:TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.white),),
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
                              if(problem.upvote != 0)
                              {
                                problem.downvote ++;
                                problem.upvote --;
                              }
                              else if (problem.upvote == 0)
                              {
                                problem.downvote ++;
                              }
                              
                              setState(() {
                                
                              });
                            },
                          ),
                          Text("${problem.downvote}", style:TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.white),),
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
    */
  }
}