import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ido_edu/blocs/counter_bloc.dart';
import 'package:ido_edu/models/operation.dart';


class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final counterBloc = CounterBloc();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          bloc: counterBloc,
            builder: (context, state){
            if(state is CounterInitial){
              return createTxtBtn(true, 0);
            }
            else if(state is CounterLoading)
              {
                return createTxtBtn(false, -1);
              }
            else if(state is CounterLoaded){
              return createTxtBtn(true, state.operation.counterValue);
            }
            return Column();
        })
      ),
    );
  }


  Widget createTxtBtn(bool status, int counterValue)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(onPressed: status ? () => counterBloc.add(GetOperation(counterValue, "minus")) : null , icon: const Icon(Icons.remove)),
        createCounter(status, counterValue),
        IconButton(onPressed: status ? () => counterBloc.add(GetOperation(counterValue, "plus")) : null, icon: const Icon(Icons.add))
      ],
    );
  }
  
  Widget createCounter(bool status, int counterValue)
  {
    if(status == true )
      {
        return Text(counterValue.toString());
      }
    else{
      return CircularProgressIndicator();
    }
  }
}
