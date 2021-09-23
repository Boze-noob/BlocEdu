part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();
}

class CounterInitial extends CounterState {

  const CounterInitial();

  @override
  List<Object> get props => [];
}

class CounterLoading extends CounterState {
  const CounterLoading();

  @override
  List<Object> get props => [];
}

class CounterLoaded extends CounterState {
  final Operation operation;
  const CounterLoaded(this.operation);

  @override
  List<Object> get props => [operation];
}
