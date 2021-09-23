import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ido_edu/models/operation.dart';
import 'package:ido_edu/utils/delay.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial());

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    yield CounterLoading();
    if(event is GetOperation)
      {
        await delay(3000);
        final Operation operation = getData(event.counterValue, event.operation);
        yield CounterLoaded(operation);
      }
  }


  Operation getData(int int, String string)
  {
    if(string == "minus")
      {
        int = int - 1;
      }
    else
      {
        int = int + 2;
      }

    return Operation(counterValue: int, operation: string);
  }

}

