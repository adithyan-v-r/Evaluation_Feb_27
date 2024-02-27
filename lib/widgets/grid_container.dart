import 'package:evaluation/screen/homepage.dart';
import 'package:flutter/material.dart';

class GridContainer extends StatelessWidget {
  String? name, description, id, image;

  GridContainer(
      {Key? key,
      required this.id,
      required this.name,
      required this.description,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Color(0xFFFFFFFF),
      shadowColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
                alignment: AlignmentDirectional.topStart,
                child: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    radius: 12,
                    child: Text(
                      id.toString(),
                      style: TextStyle(color: Colors.white),
                    ))),
            Image.network(width: 65, height: 65, image!),
            Text(name!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(
              maxLines: 2,
              description!,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
