class User 
{
  String? name,id, password;
  int role;
  
  User({required this.name, required this.id, required this.password, required this.role});

  static List<User> users = 
  [
    User(id: '202301', name: 'Hamad Hadi', password: 'asd123', role: 1),
    User(id: '202302', name: 'Amjad Mohanna', password: 'asd123', role: 1),
    User(id: '202303', name: 'Rayan Alfaify', password: 'asd123', role: 1),

    User(id: '20230001', name: 'Raghad Al-Asmari', password: 'asd123', role: 2),
    User(id: '20230002', name: 'Hadeel Al-Asmari', password: 'asd123', role: 2),
    User(id: '20230003', name: 'Khalid Alshahrani', password: 'asd123', role: 2),
    User(id: '20230004', name: 'Mohemmed Alfaify', password: 'asd123', role: 2)
  ];
}