import 'package:flutter/material.dart';
import 'package:flutter_team/models/problems_model.dart';
import 'package:flutter_team/widgets/Admin_problems_solve.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHomeScreen extends StatefulWidget
{
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}


class _AdminHomeScreenState extends State<AdminHomeScreen>
{  
  List<Problems> generalProb =[];
  List<Problems> acadimicProb =[];
  List<Problems> scheduleProb = [];

  String encodedData = '';


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
          title: const Text('Advisor Home Page'),
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
                  Color.fromARGB(255, 247, 207, 237),
                  Color.fromARGB(149, 92, 143, 211),
                  Color.fromARGB(158, 227, 226, 214),
                  ]
              )
            ),
          )
        ),


        // drawer: const AppDrawer(),


        body: TabBarView
        (
          children:
          [
            _generalList(),
            _acadimicList(),
            _scheduleList()
          ],
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
        return AdminProblemsSolve(stuProbs: generalProb[index], onDeleteClicked: () 
        {
          print('card deleted');
          generalProb.removeAt(index);
          setState(() {
            
          });
        },);
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
        return AdminProblemsSolve(stuProbs: acadimicProb[index], onDeleteClicked: () {
          acadimicProb.removeAt(index);
          setState(() {
            
          });
      });
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
          return AdminProblemsSolve(stuProbs: scheduleProb[index], onDeleteClicked: () {
          scheduleProb.removeAt(index);
          setState(() {
            
          });
      });
        },
      );
    }

    Future<void> _saveToJson() async 
    {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      encodedData = Problems.encode
      (
        generalProb
      );
      await prefs.setString('general_Prob', encodedData);
    }
}