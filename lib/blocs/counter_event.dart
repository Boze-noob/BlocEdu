part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class GetOperation extends CounterEvent{

  final String operation;
  final int counterValue;

  GetOperation(this.counterValue, this.operation);

  @override
  List<Object?> get props => [counterValue, operation];

}
