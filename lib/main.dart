import 'package:flutter/material.dart';
import 'package:untitled12/student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Denys Kipkalo'),
    );
  }
}

class StudentInfo extends StatelessWidget {
  const StudentInfo({Key? key, required this.student}) : super(key: key);
  final Student student;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.only(bottom: 5),
      color: Colors.grey.withOpacity(0.3),
      child: Text(
        'name:  ${student.firstName} \nsurname:  ${student.secondName} \nage:  ${student.age} ',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Student student = Student('Denys', 'Kipkalo', 24);
  List<Student> studentCard = [];

  void _addStudent() {
    setState(() {
      studentCard
          .add(Student(student.firstName, student.secondName, student.age));
      student.firstName = student.firstName + 'a';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            studentCard.length,
            (i) => StudentInfo(student: studentCard[i]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addStudent,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
