import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterpractice/drink_detail.dart';
import 'package:flutterpractice/main.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url = Uri.parse(
      'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail');
  var res, drinks;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    res = await http.get(url);
    drinks = jsonDecode(res.body)['drinks'];
    print(drinks.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:[
                myColor,
                Colors.red,
              ] ,
        
          ),
          ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Cocktail App'),
          elevation: 0.0,
        ),
        body: Center(
            child: res != null
                ? ListView.builder(
                    itemCount: drinks.length,
                    itemBuilder: (context, index) {
                      var drink = drinks[index];
                      return ListTile(
                        leading: Hero(
                          tag: drink['idDrink'],
                            child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              drink['strDrinkThumb'] ?? 'https://www.thermaxglobal.com/wp-content/uploads/2020/05/image-not-found.jpg',
                            ),
                          ),
                        ),
                        title: Text(
                          "${drink["strDrink"]}",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          "${drink["idDrink"]}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DrinkDetails(drink:drink),
                                  ),
                        );
                        },
                      );
                    },
                  )
                : CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )),
      ),
    );
  }
}
