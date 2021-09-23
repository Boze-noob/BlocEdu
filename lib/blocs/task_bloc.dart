import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ido_edu/database/local_database.dart';
import 'package:ido_edu/models/todo.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {

  List<ToDo> list;

  TaskBloc(this.list) : super(TaskState(list: list, status: TaskStateStatus.Initialized));

  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {

    TaskDatabase taskDatabase = TaskDatabase();
    taskDatabase.initializeDatabase();

    if(event is AddEvent)
      {
        yield* _add(event, taskDatabase);
      }
    else if(event is RemoveEvent)
      {
        yield* _remove(event, taskDatabase);
      }
  }

  Stream<TaskState> _add(AddEvent event, TaskDatabase taskDatabase) async*{

    List<ToDo> list = await taskDatabase.getTasks();
    bool test = false;
    for(int i = 0; i < list.length; i++)
      {
        if(event.string == list[i].text)
          {
            test = true;
            break;
          }
        else
          {
          test = false;
        }
      }

    if(test != true)
      {
        ToDo toDo = ToDo(isCompleted: 0, text: event.string);
        taskDatabase.insertTasks(toDo);
        list = await taskDatabase.getTasks();
        yield state.copyWith(status: TaskStateStatus.Loaded, list: list, message:  "Task is added");

      }
    else
      {
        yield state.copyWith(status: TaskStateStatus.Error, list: list, message:  "Task already exist!");
    }
  }

  Stream<TaskState> _remove(RemoveEvent event, TaskDatabase taskDatabase) async*{

    taskDatabase.deleteTasks(event.index);
    List<ToDo> list = await taskDatabase.getTasks();
    yield state.copyWith(status: TaskStateStatus.Loaded, list: list, message: "Task is removed");

  }

}
