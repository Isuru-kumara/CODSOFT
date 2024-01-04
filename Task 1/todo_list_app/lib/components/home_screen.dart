import 'package:flutter/material.dart';
import 'package:todo_list_app/components/add_todo_screen.dart';
import '../components/list.dart';
import '../widgets/utiles.dart';
import '../widgets/list_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: todoBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: Text(
                          'Your To-Do List',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      for (ToDo todoo in _foundToDo.reversed)
                        ToDoItem(
                          todo: todoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                    // margin: EdgeInsets.only(
                    //   bottom: 20,
                    //   right: 20,
                    //   left: 20,
                    // ),
                    // padding: EdgeInsets.symmetric(
                    //   horizontal: 20,
                    //   vertical: 20,
                    // ),
                    // decoration: BoxDecoration(
                    //   color: Color.fromARGB(255, 81, 255, 0),
                    //   boxShadow: const [
                    //     BoxShadow(
                    //       color: Colors.grey,
                    //       offset: Offset(0.0, 0.0),
                    //       blurRadius: 10.0,
                    //       spreadRadius: 0.0,
                    //     ),
                    //   ],
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    // child: TextField(
                    //   controller: _todoController,
                    //   decoration: InputDecoration(
                    //       hintText: 'Enter your todo task',
                    //       border: InputBorder.none),
                    // ),
                    ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 0,
                  top: 500,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    _addToDoItem(_todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: todoYellow,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTodoScreen()),
    );

    if (result != null && result is String) {
      setState(() {
        todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: result,
        ));
      });
    }
  }

  // void _addToDoItem(String toDo) {
  //   setState(() {
  //     todosList.add(ToDo(
  //       id: DateTime.now().millisecondsSinceEpoch.toString(),
  //       todoText: toDo,
  //     ));
  //   });
  //   _todoController.clear();
  // }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

//Search

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: todoBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search Your Task',
          hintStyle: TextStyle(color: todoGrey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: todoBGColor,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        // Icon(
        //   Icons.menu,
        //   color: tdBlack,
        //   size: 30,
        // ),
        // Container(
        //   height: 40,
        //   width: 40,
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(20),
        //     child: Image.asset('assets/images/avatar.jpeg'),
        //   ),
        // ),
      ]),
    );
  }
}
