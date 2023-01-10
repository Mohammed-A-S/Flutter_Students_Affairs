import 'dart:convert';

class Problems
{
  String student_name;
  String student_id;
  String student_level;
  String department;
  String problem;
  

  String advisor_name;
  String advisor_id;
  String answer;
  
  int upvote = 0;
  int downvote = 0;

  String kind;
  
  Problems
  (
    { 
      required this.student_name, 
      required this.student_id, 
      required this.student_level, 
      required this.department, 
      required this.problem, 
      required this.advisor_name, 
      required this.advisor_id, 
      required this.answer, 
      required this.upvote, 
      required this.downvote, 
      required this.kind,
    }
  );


    factory Problems.fromJson(Map<String, dynamic> jsonData) 
    {
    return Problems
    (
      student_name: jsonData['student_name'],
      student_id: jsonData['student_id'],
      student_level: jsonData['student_level'],
      department: jsonData['department'],
      problem: jsonData['problem'],
      advisor_name: jsonData['advisor_name'],
      advisor_id: jsonData['advisor_id'],
      answer: jsonData['answer'],
      upvote: jsonData['upvote'],
      downvote: jsonData['downvote'],
      kind: jsonData['kind']
    );
  }

  static Map<String, dynamic> toMap(Problems problem) => 
  {
    'student_name': problem.student_name,
    'student_id': problem.student_id,
    'student_level': problem.student_level,
    'department': problem.department,
    'problem': problem.problem,
    'advisor_name': problem.advisor_name,
    'advisor_id': problem.advisor_id,
    'answer': problem.answer,
    'upvote': problem.upvote,
    'downvote': problem.downvote,
    'kind': problem.kind,
  };

  static String encode(List<Problems> musics) => json.encode
  (
    musics.map<Map<String, dynamic>>((music) => Problems.toMap(music)).toList(),
  );

  static List<Problems> decode(String musics) =>
    (json.decode(musics) as List<dynamic>)
      .map<Problems>((item) => Problems.fromJson(item))
      .toList();

  void removeWhere(bool Function(dynamic item) param0) {}
}
