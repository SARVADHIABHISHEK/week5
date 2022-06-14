import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/api_model.dart';

class ImagesSlider extends StatefulWidget {
  final List<ApiModel> todo;

  ImagesSlider({Key? key, required this.todo}) : super(key: key);

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Images'),
      ),
      body: GridView.builder(
          itemCount: widget.todo.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? 3
                    : 2,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
          itemBuilder: (context, index) {
            final item = widget.todo[index];
            final List<String?>? images = item.sliderImages?.map((e) => e.image).toList();
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                shadowColor: Colors.black,
                elevation: 13.0,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('${images![index]}'),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // child: Container(alignment: Alignment.bottomCenter,child: Text(item.title!)),
                ),
              ),
            );
          }),
    );
  }
}
