import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ido_edu/blocs/tab_bloc.dart';


class WeightButton extends StatelessWidget {

  final int index;
  final String weightStr;
  const WeightButton({Key? key, required this.index, required this.weightStr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(
      builder: (BuildContext context, state) {
        if(state is TabInitial){
          return createButton(context, state.weight.index);
        }
        else if(state is TabLoaded)
          {
            return createButton(context, state.weight.index);
          }
        else{
          return createButton(context, -1);
        }
      }
    );
  }

  Widget createButton(BuildContext context, int selectIndex)
  {
    return InkWell(
      onTap: () => submitIndex(context, index),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 0.5),
          borderRadius: BorderRadius.circular(15),
          color: selectIndex == index ? Colors.orange : Colors.transparent,
        ),
        child: Padding(
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
                bottom: 10
            ),
            child: Text(
                weightStr,
                style: TextStyle(color: selectIndex == index ? Colors.white : Colors.orange,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                )
            )
        ),
      ),
    );
  }

  void submitIndex(BuildContext context, int index)
  {
    final weightBloc = BlocProvider.of<TabBloc>(context);
    weightBloc.add(GetTab(index));
  }

}
