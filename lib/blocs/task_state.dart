part of 'task_bloc.dart';

enum TaskStateStatus{Loaded, Initialized, Error}


class TaskState {
  final List<ToDo>? list;
  TaskStateStatus status;
  final String? message;
  TaskState({this.list, required this.status, this.message});
  
  TaskState copyWith({required List<ToDo> list, required TaskStateStatus status, required String message}){
    return TaskState(list: list ?? this.list, status: status ?? this.status, message: message ?? message);
  }


}

