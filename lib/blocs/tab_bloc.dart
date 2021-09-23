import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ido_edu/models/weight.dart';
import 'package:ido_edu/utils/delay.dart';

part 'tab_event.dart';
part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(TabInitial(Weight(index: 0, imgPath: 'assets/1.png')));

  @override
  Stream<TabState> mapEventToState(
    TabEvent event,
  ) async* {
    yield TabLoading();
    if(event is GetTab)
      {
        await delay(1500);
        final weight = getData(event.index);
        yield TabLoaded(weight);
      }
  }


  Weight getData(int index){
    late String imgPath;
      switch(index)
      {
        case(0):
          imgPath = 'assets/1.png';
          break;
        case(1):
          imgPath = 'assets/2.png';
          break;
        case(2):
          imgPath = 'assets/3.png';
          break;
        case(3):
          imgPath = 'assets/4.png';
          break;
        default:
          imgPath = 'assets/1.png';
          break;
      }

    return Weight(index: index, imgPath: imgPath);

  }

}
