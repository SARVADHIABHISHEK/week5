import 'package:countertask/src/blocs/counterbloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: counterBloc.increamentStream,
      initialData: 0,
      builder: (context, snapshot) {
        return Scaffold(
          body: Center(
            child: Text(snapshot.data.toString()),
          ),
          floatingActionButton: Row(
            mainAxisAlignment:  MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  counterBloc.increamentSink(snapshot.data!);
                  print(snapshot.data);
                  // eventBloc(counterEvent.increment);
                },
                child: const Icon(Icons.add),
              ),
             const SizedBox(width: 20,),
              FloatingActionButton(
                onPressed: () {
                  counterBloc.decrementSink(snapshot.data!);
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        );
      }
    );
  }
}
