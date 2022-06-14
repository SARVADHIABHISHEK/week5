import 'package:countertask/src/views/persistancetabbarpage1.dart';
import 'package:countertask/src/views/persistancetabbarpage2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersistenceTabBar extends StatefulWidget {
  const PersistenceTabBar({Key? key}) : super(key: key);

  @override
  State<PersistenceTabBar> createState() => _PersistenceTabBarState();
}

class _PersistenceTabBarState extends State<PersistenceTabBar> {
  int _index = 0;
  final List<Widget> _widgets = <Widget>[Page1(), Page2()];

  void _changeIndexMethod(int value) {
    _index = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      /* appBar: AppBar(
        title: const Text('Persistance Tab Bar'),
      ),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _index,
              children: _widgets,
            ),
          ),
        ],
      ),*/
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
        currentIndex: _index,
        onTap: (index) {
          _changeIndexMethod(index);
        },
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return (CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(child: Page1());
            }));
          case 1:
            return (CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(child: Page1());
              },
            ));
        }
      },
    );
  }
}
