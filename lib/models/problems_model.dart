class Problems
{
  String? student_name;
  String? student_id;
  String? student_level;
  String department;
  String problem;

  String? admin_name;
  String? admin_id;
  String? answer;

  int upvote = 0;
  int downvote = 0;

  String kind;



  Problems
  (
    this.student_name, 
    this.student_id, 
    this.student_level, 
    this.department, 
    this.problem, 

    this.admin_name, 
    this.admin_id, 
    this.answer, 
    
    this.upvote, 
    this.downvote, 
    
    this.kind,
  );



  static List<dynamic> dummyProblems =
  [
    Problems("Mohammed Hassan", "20230001", "3", "information systems", "the proplem skjdhf jdshf lskj dfka sdfsjdhf shdfh lasidjfh", "Ahmed Hassan", "101", "jsdbc kjsb dckjsd bcsd cjs dkcjh sk osdhc", 202, 16, "Gerenal"),
    Problems("Moshabbab Alqahtani ", "20230002", "7", "computer since", "the proplem skjdhf jdshf lskj dfka sdfsjdhf shdfh lasidjfh", "Ahmed Hassan", "102", "jsdbc kjsb dckjsd bcsd cjs dkcjh sk osdhc", 161, 22, "asas"),
    Problems("Hassan Alahmary", "20230003", "5", "program enigner", "the proplem skjdhf jdshf lskj dfka sdfsjdhf shdfh lasidjfh sdj,fns slkd flsdhlksdflksdhf sjdhf sdjfhksjdhfk kjsdhf ksjdfh kjsdhf kjsdhfjsdhf ksdhfkjs fk", "Ahmed Hassan", "101", "jsdbc kjsb dckjsd bcsd cjs dkcjh sk osdhc", 115, 12, "Gerenal"),
    Problems("Hamad Alshihry", "20230004", "1", "information systems", "the proplem skjdhf jdshf lskj dfka sdfsjdhf shdfh lasidjfh", "Ahmed Hassan", "102", "jsdbc kjsb dckjsd bcsd cjs dkcjh sk osdhc", 92, 5, "asas"),
  ];
}