import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  String id, name, image, description;
  DetailsPage(
      {Key? key,
      required this.image,
      required this.description,
      required this.name,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: [

          Image.network(image),
          Text(
            description,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ]),
      ),
    );
  }
}
