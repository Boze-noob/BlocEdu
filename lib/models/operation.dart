

import 'package:equatable/equatable.dart';

class Operation extends Equatable{
  final String operation;
  final int counterValue;


  Operation({required this.counterValue, required this.operation});

  @override
  List<Object?> get props => [counterValue, operation];

}