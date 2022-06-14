import 'package:countertask/src/blocs/boolCheckblock.dart';
import 'package:flutter/material.dart';

class BoolCheckPage extends StatefulWidget {
  const BoolCheckPage({Key? key}) : super(key: key);

  @override
  State<BoolCheckPage> createState() => _BoolCheckPageState();
}

class _BoolCheckPageState extends State<BoolCheckPage> {
  BoolCheck checkBool = BoolCheck();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: checkBool.boolValue,
        initialData: false,
        builder: (context, snapshot) {
          return Scaffold(
            body: Center(
              child: Text(snapshot.data.toString()),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                checkBool.check(snapshot.data!);

                // eventBloc(counterEvent.increment);
              },
              label: const Text('Check'),
            ),
          );
        });
  }
}
