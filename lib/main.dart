import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HabitApp()));
}

class HabitApp extends StatefulWidget {
  @override
  State<HabitApp> createState() => _HabitState();
}

class _HabitState extends State<HabitApp> {
  List<String> habits = [
    'Drink water',
    'Read a book',
    'Do exercise',
    'Listen to the music',
    'Go for a walk',
    'Meeting with friends',
  ];
  List<bool> done = [false, false, false, false, false, false];
  void addHabit() {
    setState(() {
      habits.add('New habit');
      done.add(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 204, 221),
      appBar: AppBar(
        title: Text('Habit tracker', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'My habits',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),

          Text('Done: ${done.where((x) => x).length} / ${habits.length}'),

          Expanded(
            child: ListView.builder(
              itemCount: habits.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.all(8),

                  child: ListTile(
                    title: Text(habits[index]),
                    trailing: Checkbox(
                      value: done[index],
                      onChanged: (value) {
                        setState(() {
                          done[index] = value!;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addHabit,
        backgroundColor: Colors.amberAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}
