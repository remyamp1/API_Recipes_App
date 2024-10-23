import 'dart:convert';


import 'package:api_recipes_app/Data_Model.dart';
import 'package:api_recipes_app/Data_Model.dart';
import 'package:api_recipes_app/Recipes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  bool _isLoading=true;
  @override
  void initState(){
    super.initState();
    _getData();
  }
Recipesmodelapi? dataFromAPI;
  _getData() async{
    try {
      String url="https://dummyjson.com/recipes";
      http.Response res=await http.get(Uri.parse(url));
      if(res.statusCode ==200){
        dataFromAPI=Recipesmodelapi.fromJson(json.decode(res.body));
        _isLoading=false;
        setState(() {});
      }
    } catch (e) {
     debugPrint (e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:  const Color.fromARGB(255, 255, 195, 232),
      appBar: AppBar(
        title: Text("Recipes App"),
        backgroundColor: const Color.fromARGB(255, 255, 195, 232),
      ),
      body: _isLoading?
      const Center(
        child: CircularProgressIndicator(),
      )
      :dataFromAPI==null?
      const Center(
        child: Text('Failed to load data'),
      )
      
     : GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 2,crossAxisSpacing: 3),
     itemCount: dataFromAPI!.recipes.length,
       itemBuilder: (context,index){
        final Recipe =dataFromAPI!.recipes[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Recipes(recipes: Recipe,)));
          },
          child: Container(
            height: 300,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black,
            width: 2),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 253, 214, 241),
                blurRadius: 0,
                spreadRadius: 1,
              )
            ]),
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
           child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    
                Image.network(Recipe.image,width: 100,height: 65,),
            SizedBox(height: 10),
                
                Text(Recipe.name,style: TextStyle(fontSize: 10,color: Colors.black),),
               SizedBox(height: 5),

                Row(
                  children: [
                    SizedBox(width: 30),
                    Text(Recipe.cuisine),
                    SizedBox(width: 5),
      
           
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}