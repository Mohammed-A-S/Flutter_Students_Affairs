import 'package:flutter/material.dart';
import 'package:flutter_team/screens/admin_screens/admin_add_solve.dart';
import 'package:flutter_team/models/problems_model.dart';

class AdminProblemsSolve extends StatefulWidget 
{
  AdminProblemsSolve({required this.stuProbs,required this.onDeleteClicked, super.key});
  Problems stuProbs;
  Function onDeleteClicked;

  @override
  State<AdminProblemsSolve> createState() => _AdminProblemsSolveState();
}

class _AdminProblemsSolveState extends State<AdminProblemsSolve> 
{
  Function get onDeleteClicked  => widget.onDeleteClicked;
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
        child: Padding
        (
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
                  Text(widget.stuProbs.student_name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),),
                  Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: 
                    [
                      Text("${widget.stuProbs.student_id}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromARGB(158, 255, 255, 255)),),
                      Text(widget.stuProbs.department, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromARGB(158, 255, 255, 255)),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text(widget.stuProbs.problem, style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.white),),

                  SizedBox(height: 25,),
                  Text(widget.stuProbs.advisor_name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),),
                  Text(widget.stuProbs.advisor_id, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromARGB(158, 255, 255, 255)),),
                  SizedBox(height: 10,),
                  Text(widget.stuProbs.answer, style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.white),),
                ],
              ),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddingSolve(advisor_name: widget.stuProbs.advisor_name, advisor_id: widget.stuProbs.advisor_id, answer: widget.stuProbs.answer,),)).then((value) 
                      {
                        if(value != null) 
                        {
                          widget.stuProbs.advisor_name = value.advisor_name;
                          widget.stuProbs.advisor_id = value.advisor_id;
                          widget.stuProbs.answer = value.answer;
                          
                          setState(() {
                            
                          });
                        }
                      });
                    }, 
                    child: Text("Solve", style: TextStyle(color: Color.fromARGB(255, 126, 169, 204), fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  ElevatedButton
                  (
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0),)),
                    onPressed: () {
                      
                    },//() => onDeleteClicked(),
                    
                    child: Text("Appointment", style: TextStyle(color: Color.fromARGB(255, 126, 169, 204), fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}