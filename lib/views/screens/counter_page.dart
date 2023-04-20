import 'dart:async';

import 'package:contact_diary/controller/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class counterpage extends StatefulWidget {
  const counterpage({Key? key}) : super(key: key);

  @override
  State<counterpage> createState() => _counterpageState();
}

class _counterpageState extends State<counterpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Page"),
        centerTitle: true,
      ),
      floatingActionButton: Consumer<CounterProvider>(
        builder: (context,cp,_) {
          return FloatingActionButton(
            onPressed: () {
              // cp.incremnet();
              Provider.of<CounterProvider>(context,listen: false).incremnet();
            },
            child: Icon(Icons.add),
          );
        }
      ),
      // body: Container(
      //   alignment: Alignment.center,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Consumer<CounterProvider>(
      //         builder: (context, cp, _) {
      //           return Text(
      //             "${Provider.of<CounterProvider>(context).counterModel.counter}",
      //             // "${cp.counterModel.counter}",
      //             style: TextStyle(
      //               fontSize: 60,
      //             ),
      //           );
      //         },
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
