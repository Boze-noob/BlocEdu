part of 'tab_bloc.dart';


abstract class TabState extends Equatable {
  const TabState();

}

class TabInitial extends TabState {
  final Weight weight;
  const TabInitial(this.weight);

  @override
  List<Object> get props => [weight];
}

class TabLoading extends TabState {
  const TabLoading();

  @override
  List<Object> get props => [];


}

class TabLoaded extends TabState {
  final Weight weight;
  const TabLoaded(this.weight);

  @override
  List<Object> get props => [weight];
}
