import 'package:countertask/src/blocs/apibloc.dart';
import 'package:countertask/src/provider/api_provider.dart';
import 'package:countertask/src/views/sliderimages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/api_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiProvider provider = ApiProvider();
  ApiBloc apiBloc = ApiBloc();

  @override
  void initState() {
    super.initState();
    apiBloc.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api integration'),
      ),
      body: StreamBuilder<List<ApiModel>>(
          stream: apiBloc.apidata,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  itemBuilder: (context, index) {
                    final item = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => ImagesSlider(todo: snapshot.data!)));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          shadowColor: Colors.black,
                          elevation: 10.0,
                          child: Column(
                            children: [
                              Container(
                                height: 130,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(item.image!),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      child: Text(
                                        item!.title.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(child: Text('loading'));
            }
          }),
    );
  }
}
