
import 'package:flutter/material.dart';
import 'package:ido_edu/main.dart';
import 'package:ido_edu/screens/fourth_screen.dart';
import 'package:ido_edu/screens/second_screen.dart';
import 'package:ido_edu/screens/third_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      title: Text("First screen"),
        automaticallyImplyLeading: false,
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            SecondScreen(data: 'Hello there from the first page!'),
                      )
                  );
                },
                child: Text("Open UI"),
              ),

              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ThirdScreen(),
                   )
                );
              },
                  child: Text("Open Counter")
              ),

              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => FourthScreen(),
                    )
                    );
                  },
                  child: Text("Open ToDo list")
              )
            ],
          ),
      )

    );
  }
}



