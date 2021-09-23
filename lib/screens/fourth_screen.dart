import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ido_edu/blocs/task_bloc.dart';
import 'package:ido_edu/database/local_database.dart';
import 'package:ido_edu/models/todo.dart';
import 'package:ido_edu/utils/delay.dart';
import 'package:ido_edu/widgets/remaining_txt.dart';


class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  _FourthScreenState createState() => _FourthScreenState();

}

class _FourthScreenState extends State<FourthScreen> {

  final textFieldController = TextEditingController();
  List<ToDo> list = [];
  TaskBloc _taskBloc = TaskBloc([]);

  


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _taskBloc,
      child: BlocListener<TaskBloc, TaskState>(
        bloc: _taskBloc,
        listener: (BuildContext context, state) {
          if(state.status == TaskStateStatus.Loaded)
            {
              showSnackBar(context, state.message);
            }
          if(state.status == TaskStateStatus.Error)
          {
            showSnackBar(context, state.message);
          }
        },
        child: BlocBuilder<TaskBloc, TaskState>(
          bloc: _taskBloc,
          buildWhen: (previousState, currentState) => currentState.status == TaskStateStatus.Initialized || currentState.status == TaskStateStatus.Loaded,
          builder: (context, taskState) {
            return Scaffold(
              backgroundColor: Colors.black45,
              body: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.only(top: 40, left: 20),
                      child: RemainingTxt(taskBloc: _taskBloc, list: list)
                      ),
                    ),


                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.0, horizontal: 2.0),
                            child: Card(
                              color: Colors.deepPurpleAccent,
                              child: Padding(
                                padding: EdgeInsets.only(left: 40),
                                child: ListTile(
                                  title: /*taskState.status == TaskStateStatus.Loaded ?*/ createTitle(taskState.list![index].text.toString()) /*: createTitle(list[index].text)*/,
                                  trailing: IconButton(icon: Icon(
                                    Icons.delete, color: Colors.red),
                                      onPressed: () => /*taskState.status == TaskStateStatus.Loaded ?*/ deleteTask(taskState.list![index].id!, context)/* : deleteTask(list[index].id!, context))*/,
                                ),
                              ),
                            ),
                          ));
                        },
                        itemCount: /*taskState.status == TaskStateStatus.Loaded ?*/ taskState.list!.length /*: list.length*/),
                  )
                ],
              ),

              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery
                        .of(context)
                        .viewInsets
                        .bottom),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 8),
                        child: TextField(
                          controller: textFieldController,
                          decoration: InputDecoration(
                              hintText: "Buy milk",
                              hintStyle: TextStyle(color: Colors.black45),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(borderSide: BorderSide(
                                  width: 1, color: Colors.white),
                                  borderRadius: BorderRadius.circular(10))
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),

                    MaterialButton(
                      onPressed: () => createNewTask(context),
                      color: Colors.deepPurpleAccent,
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                      padding: EdgeInsets.all(16),
                      shape: CircleBorder(),
                    )
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  void createNewTask(BuildContext context)
  {
    if(textFieldController.text.trim().isEmpty)
      {
        showSnackBar(context, "Write your task");
      }
    else{
      context.read<TaskBloc>().add(AddEvent(string: textFieldController.text));
    }
  }

  void deleteTask(int id, BuildContext context)
  {
    context.read<TaskBloc>().add(RemoveEvent(index: id));
  }


  Widget createTitle(String string)
  {
    return Text(string, style: TextStyle(
        color: Colors.white, fontSize: 23));
  }

  void fetchData() async{
    TaskDatabase taskDatabase = TaskDatabase();
    taskDatabase.initializeDatabase();
    list = await taskDatabase.getTasks();
    setState(() {
      _taskBloc = TaskBloc(list);
    });
  }



}
