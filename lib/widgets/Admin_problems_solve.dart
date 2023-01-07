import 'package:flutter/material.dart';
import 'package:flutter_team/Team_sharing/problem_page.dart';
import 'package:flutter_team/Team_sharing/student_problems.dart';
import 'package:flutter_team/models/problems_model.dart';

class AdminProblemsSolve extends StatelessWidget 
{
  const AdminProblemsSolve({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return ListView.builder
    (
      itemCount: Problems.dummyProblems.length,
      itemBuilder: (context, index) 
      {
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
                  Column
                  (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: 
                    [
                      Text(Problems.dummyProblems[index].student_name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),),
                      Row
                      (
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: 
                        [
                          Text("${Problems.dummyProblems[index].student_id}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromARGB(158, 255, 255, 255)),),
                          Text(Problems.dummyProblems[index].department, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromARGB(158, 255, 255, 255)),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Text(Problems.dummyProblems[index].problem, style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.white),),            
                  SizedBox(height: 15,),
                  Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: 
                    [
                      ElevatedButton
                      (
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0),)),
                        onPressed: () 
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AddingPage(),));
                        }, 
                        child: Text("Solve", style: TextStyle(color: Color.fromARGB(255, 126, 169, 204), fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                      ElevatedButton
                      (
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0),)),
                        onPressed: () 
                        {
                          print("Appointment");
                        }, 
                        child: Text("Appointment", style: TextStyle(color: Color.fromARGB(255, 126, 169, 204), fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}