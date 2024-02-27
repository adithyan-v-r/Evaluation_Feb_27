import 'package:evaluation/models/meal_model.dart';
import 'package:evaluation/screen/detailedpage.dart';
import 'package:evaluation/widgets/grid_container.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> data = [];
  getData() async {
    try {
      var url = Uri.parse('https://themealdb.com/api/json/v1/1/categories.php');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          data = mealFromJson(response.body).categories;
        });
      } else {
        print("Data retrieve failed");
      }
    } catch (e) {
      print("Error retrieving Data ");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(
                  'https://images.pexels.com/photos/326281/pexels-photo-326281.jpeg'))),
      child: data == null
          ? const CircularProgressIndicator()
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return InkWell(
                    child: GridContainer(
                      name: data[index].strCategory,
                      description: data[index].strCategoryDescription,
                      id: data[index].idCategory,
                      image: data[index].strCategoryThumb,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return DetailsPage(
                              image: data[index].strCategoryThumb,
                              description: data[index].strCategoryDescription,
                              name: data[index].strCategory,
                              id: data[index].idCategory);
                        },
                      ));
                    });
              },
            ),
    ));
  }
}
