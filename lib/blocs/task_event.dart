part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class AddEvent extends TaskEvent{

  final String string;

  AddEvent({required this.string});
}

class RemoveEvent extends TaskEvent{

  final int index;

  RemoveEvent({required this.index});
}
