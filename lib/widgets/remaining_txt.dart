import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ido_edu/blocs/task_bloc.dart';
import 'package:ido_edu/models/todo.dart';


class RemainingTxt extends StatefulWidget {

  final TaskBloc taskBloc;
  final List<ToDo> list;

  const RemainingTxt({Key? key, required this.taskBloc, required this.list}) : super(key: key);

  @override
  _RemainingTxtState createState() => _RemainingTxtState();
}

class _RemainingTxtState extends State<RemainingTxt> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Padding(
          padding: EdgeInsets.only(top: 15, left: 20),
          child: BlocBuilder<TaskBloc, TaskState>(
            bloc: widget.taskBloc,
            buildWhen: (previousState, currentState) => previousState.list!.length != currentState.list!.length/*currentState.status == TaskStateStatus.Initialized || currentState.status == TaskStateStatus.Loaded*/,
            builder: (context, state){
             // if(state.status == TaskStateStatus.Loaded)
               // {
                  return createRemaining(state.list!.length);
                //}
              //else {
               // return createRemaining(widget.list.length);
              //}
            },
          )
      )
    );
  }


  Widget createRemaining(int size)
  {
    print("Promjenili smo remaining");
    return Text("$size remaining",
        style: TextStyle(color: Colors.white, fontSize: 30));
  }
}
