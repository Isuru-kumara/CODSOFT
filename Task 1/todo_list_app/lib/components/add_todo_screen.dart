// add_todo_screen.dart
import 'package:flutter/material.dart';
import '../widgets/utiles.dart';

class AddTodoScreen extends StatelessWidget {
  final TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: todoBGColor,
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: todoYellow,
                    width: 2.0,
                  ),
                ),
              ),
              child: TextField(
                controller: todoController,
                style: TextStyle(color: Colors.white, fontSize: 30),
                decoration: InputDecoration(
                  hintText: 'Enter your todo task',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    side: BorderSide(color: todoYellow),
                  ),
                  child: Text('Save'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
