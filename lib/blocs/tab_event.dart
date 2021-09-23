part of 'tab_bloc.dart';

abstract class TabEvent extends Equatable {
  const TabEvent();
}

class GetTab extends TabEvent{

  final int index;

  const GetTab(this.index);

  @override
  List<Object?> get props => [index];

}
