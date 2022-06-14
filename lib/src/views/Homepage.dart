import 'package:countertask/src/blocs/apibloc.dart';
import 'package:countertask/src/provider/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as lib1;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiProvider provider = ApiProvider();
  ApiBloc apiBloc = ApiBloc();

  lib1.Encrypted? encrypted;
  String? decrypted;
  lib1.Encrypter? encrypter;

  final TextEditingController _converter = TextEditingController();

  void _convertMethod(String value) {
    final key = lib1.Key.fromUtf8('Abcdefghijklpmadmuytrewrtyuijhyt');
    final iv = lib1.IV.fromLength(16);
    encrypter = lib1.Encrypter(lib1.AES(key));
    encrypted = encrypter?.encrypt(value, iv: iv);
    setState((){});
  }


  void _decrypted() {
    final iv = lib1.IV.fromLength(16);
    decrypted = encrypter?.decrypt(encrypted!, iv: iv);
    print(decrypted);
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api integration'),
      ),
      /*body: StreamBuilder<List<ApiModel>>(
          stream: apiBloc.apidata,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? 3
                        : 2,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  itemBuilder: (context, index) {
                    final item = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      ImagesSlider(todo: snapshot.data!)));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
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
                                        item.title.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(child: Text('loading'));
            }
          }),*/
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _converter,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    _convertMethod(_converter.text);
                  },
                  child: const Text('EnCrypt')),
              TextButton(
                  onPressed: () {
                    _converter.clear();
                    _decrypted();
                  },
                  child: const Text('Decrypt')),
            ],
          ),
          decrypted != null ?  Text('$decrypted') : Text('${encrypted?.base64}'),
        ],
      ),
    );
  }
}
