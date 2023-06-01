import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/Second_page.dart';
import 'package:provider_example/list_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // List<int> numbers =[1,2,3,4,];

  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
          builder: (BuildContext context, numbersProviderModel, Widget? child) =>Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
        numbersProviderModel.add();
        },child:Icon(Icons.add)),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Provide example"),
        ),
        body: 
           SizedBox(
            child: Column(
              children: [
              Text(numbersProviderModel.numbers.last.toString(),
               style: TextStyle(fontSize: 30)),
              Expanded(
                child: ListView.builder(
                  itemCount: numbersProviderModel.numbers.length,
                  itemBuilder: (context, index) {
                    return Text(
                      numbersProviderModel.numbers[index].toString(),
                      style: TextStyle(fontSize: 30),
                    );
                  },
                ),
              ),
              ElevatedButton(onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>Second()));
        
              }, child: Text("Second"))
            ]),
          ),
        )
     );
  }
}
