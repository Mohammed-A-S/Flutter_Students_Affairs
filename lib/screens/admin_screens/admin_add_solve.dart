import 'package:flutter/material.dart';

class AddingSolve extends StatefulWidget 
{
  AddingSolve({required this.advisor_name, required this.advisor_id, required this.answer, Key? key,}) : super(key: key);
  String advisor_name;
  String advisor_id;
  String answer;
  

  @override
  State<AddingSolve> createState() => _AddingSolveState();
}

class _AddingSolveState extends State<AddingSolve> 
{
  TextEditingController admin_nameController = TextEditingController();
  TextEditingController admin_idController = TextEditingController();
  TextEditingController answerController = TextEditingController();

  void _showError() 
  {
    const snackBar = SnackBar
    (
      content: Text('Please enter title and description'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text('Solve problem'),
        centerTitle: true,
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

      
      body: 
      SingleChildScrollView
      (
        child: Center
        (
          child: Padding
          (
            padding: const EdgeInsets.all(8.0),
            child: Column
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                //StudentProms(),
                TextField
                (
                  controller: admin_nameController,
                  decoration: const InputDecoration
                  (
                    border: OutlineInputBorder(),
                    labelText: 'Advisor Name',
                  ),
                ),
                SizedBox(height: 10,),
                TextField
                (
                  controller: admin_idController,
                  decoration: const InputDecoration
                  (
                    border: OutlineInputBorder(),
                    labelText: 'Advisor ID',
                  ),
                ),
                SizedBox(height: 10,),
                TextField
                (
                  controller: answerController,
                  decoration: const InputDecoration
                  (
                    border: OutlineInputBorder(),
                    labelText: 'Advisor Answer',
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton
                (
                  onPressed: () 
                  {
                    //Navigator.pop(context, admin_nameController.text);
                    if (admin_nameController.text.isEmpty || admin_idController.text.isEmpty || answerController.text.isEmpty) 
                    {
                      _showError();
                    } 
                    else 
                    {
                      Navigator.pop(context, AddingSolve(advisor_name: admin_nameController.text, 
                      advisor_id: admin_idController.text, answer: answerController.text));
                    }
                  },
                  child: const Text('Add Solve', style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
