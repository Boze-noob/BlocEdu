import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ido_edu/blocs/tab_bloc.dart';
import 'package:ido_edu/models/weight.dart';
import 'package:ido_edu/widgets/fav_icon.dart';
import 'package:ido_edu/widgets/price_txt.dart';
import 'package:ido_edu/widgets/star_rating.dart';
import 'package:ido_edu/widgets/weight_button.dart';

class SecondScreen extends StatefulWidget {

  final String data;
  const SecondScreen({Key? key, required this.data}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();

}

class _SecondScreenState extends State<SecondScreen> {

  double rating = 3.5;
  int _counter = 1;
  int _num = 1;
  final tabBloc = TabBloc();


  void _incrementCounter() {
    setState(() {
      _counter++;
      _num = _counter;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _counter = _counter > 1 ? _counter-- : 1;
      _num = _counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => tabBloc,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            elevation: 0,
            actions: <Widget>[
              Padding(padding: EdgeInsets.only(right: 10.0),
                child: FavouriteIcon()
              )
            ],
          ),
          body: SingleChildScrollView(
              child: Container(
                color: Colors.indigo,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Fruits cake",style: const TextStyle(fontSize: 30, color: Colors.white)),

                      Text("strawberry & kiwi special",style: const TextStyle(fontSize: 15,color: Colors.orange)),

                      SizedBox(height: 10),

                      Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            WeightButton(index: 0, weightStr: "1 Kg"),

                            WeightButton(index: 1, weightStr: "2 Kg"),

                            WeightButton(index: 2, weightStr: "3 Kg"),

                            WeightButton(index: 3, weightStr: "4 Kg"),

                          ],
                        ),
                      ),

                      SizedBox(height: 10),

                      Row(
                        children: [
                          Container(
                            child: BlocBuilder<TabBloc, TabState>(
                              bloc: tabBloc,
                              builder: (context, state) {
                                if(state is TabInitial){
                                  return buildImage(state.weight);
                                }
                                else if(state is TabLoading){
                                  return buildLoading();
                                }
                                else if(state is TabLoaded){
                                  return buildImage(state.weight);
                                }
                                return Container();
                              },
                            )
                          ),


                          SizedBox(width: 50),

                          Expanded(
                            child: Container(
                              height: 200,
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.add, color: Colors.white,size: 30),
                                    onPressed: () => _incrementCounter(),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10.5),
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      '$_counter',
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 23,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.remove, color: Colors.white,size: 30),
                                    onPressed: () => _decrementCounter(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      Container(
                        alignment: Alignment.bottomRight,
                        padding: const EdgeInsets.only(right: 20),
                        child: CakePrice(num: _num),
                      ),

                      SizedBox(height: 10),
                        Card(
                          color: Colors.black38,
                          margin: EdgeInsets.only(left: 20, right: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Image.asset('assets/egg.png', width: 100, height: 100),
                                      Text("4 Eggs", style: TextStyle(color: Colors.white, fontSize: 17))
                                    ],
                                  ),
                                  VerticalDivider(color: Colors.white),
                                  Column(
                                    children: <Widget>[
                                      Image.asset('assets/sugar.png', width: 100, height: 100),
                                      Text("1 cup sugar",style: TextStyle(color: Colors.white, fontSize: 17))
                                    ],
                                  ),
                                  VerticalDivider(color: Colors.white),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset('assets/vanilla.png', width: 100, height: 100),
                                        Text("2 tsp vanilla", style: TextStyle(color: Colors.white, fontSize: 17))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                        ),

                      SizedBox(height: 3),

                      Row(
                        children: <Widget>[
                          Image.asset('assets/map.png', width: 150, height: 150),
                          SizedBox(width: 20),
                          Text("DELIVERY\n45, Amarlands\nNr. Hamer Road, London", style: TextStyle(color: Colors.white, fontSize: 18))
                        ],

                      ),

                      SizedBox(height: 10),

                      Row(
                        children: <Widget>[
                          Container(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text("Ratings", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white))),
                          SizedBox(width: 5),
                          Row(
                            children: [
                              StarRating(rating: rating, onRatingChanged: (rating) => setState(() => this.rating = rating), color: Colors.orange,),
                              Text("(55)", style: TextStyle(color: Colors.white,fontSize: 15))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
              ),
          )
      ),
    );
  }

  Widget buildLoading() {
    return SizedBox(
        width: 300,
        height: 300,
        child:Center(
        child: CircularProgressIndicator()
        ),
      );
  }

  Image buildImage(Weight weight)
  {
    return Image.asset(weight.imgPath, width: 300, height: 300, fit: BoxFit.fill);
  }

}





