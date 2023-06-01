import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/list_provider.dart';


class Second extends StatefulWidget {
  // final List<int> numbers; 
  const Second({super.key, });

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
          builder: (BuildContext context, numbersListProvider, Widget? child) =>
          Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
         numbersListProvider.add();
        },child:Icon(Icons.add)),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Provide example"),
        ),
        body:  SizedBox(
            child: Column(
              children: [
              Text(numbersListProvider.numbers.last.toString(),
               style: TextStyle(fontSize: 30)),
              Container(
                height: 200,
                width: double.maxFinite,
                child: ListView.builder(
                  itemCount: numbersListProvider.numbers.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Text(
                     numbersListProvider.numbers[index].toString(),
                      style: TextStyle(fontSize: 30),
                    );
                  },
                ),
              )
            ]
          ),
        ),
      )
    );
  }
}