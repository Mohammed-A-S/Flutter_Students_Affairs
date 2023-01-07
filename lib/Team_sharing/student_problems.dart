import 'package:flutter/material.dart';

class StudentProms extends StatelessWidget 
{
  List<String> itemsList = ['generl', 'Academic', 'Schedule'];
  String? selectedItem = 'generl';


  @override
  Widget build(BuildContext context) 
  {
    return SizedBox
    (
      width: 200,
      child: DropdownButtonFormField<String>
      (
        decoration: const InputDecoration
        (
          enabledBorder: OutlineInputBorder
          (
            borderSide: BorderSide(width: 2, color: Colors.green)
          )
        ),
        value: selectedItem,
        items: itemsList
          .map
          (
            (item) => DropdownMenuItem
            (
              value: item,
              child: Text(item, style: const TextStyle(fontSize: 25))
            )
          )
        .toList(),
        onChanged: (item) => setState(() => selectedItem = item)
      ),
    );
  }

  setState(Function()) {}
}
