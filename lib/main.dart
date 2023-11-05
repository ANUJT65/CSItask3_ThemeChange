import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
 bool _iconBool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;


ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.amberAccent,
  )
  );
ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,

);


class _MyAppState extends State<MyApp> {
  List<String> tasks = []; // List to store tasks
  void addTask(String task) {
    setState(() {
      tasks.add(task);
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _iconBool? _darkTheme : _lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dark & Light theme To Do APP"),
          actions:[
            IconButton(
              onPressed: (){
                setState(() {
                  _iconBool = !_iconBool;
                });

              },
              icon: Icon(_iconBool? _iconDark:_iconLight),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete_forever),
                      onPressed: () {
                        deleteTask(index);
                      },
                    ),
                  );
                },
              ),
            ),
            TextField(
              onSubmitted: (value) {
                addTask(value);
              },
              decoration: InputDecoration(
                hintText: "Add a task",
                contentPadding: const EdgeInsets.all(16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}