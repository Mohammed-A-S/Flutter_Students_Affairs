class student 
{
  String? student_name;
  int? Student_id;
  int? student_level;
  String? student_password;
  String? student_major;


  List<dynamic> dummyStudents = 
  [
    student("Mohammed Ali", 20230001,  3, "123abc", "information systems"),
    student("Khalid hassan", 20230001,  3, "123abc", "information systems"),
    student("Raghad Ahmad", 20230001,  3, "123abc", "information systems"),
    student("Raghad Ahmad", 20230001,  3, "123abc", "information systems"),
  ];

  student(this.student_name, this.Student_id, this.student_level, this.student_password ,this.student_major);
}