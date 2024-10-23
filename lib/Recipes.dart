
import 'package:api_recipes_app/Data_Model.dart';
import 'package:flutter/material.dart';

class Recipes extends StatelessWidget{

   final Recipe recipes;
const Recipes({required this.recipes});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   backgroundColor:  const Color.fromARGB(255, 255, 195, 232),
   
      appBar: AppBar(
        
        title: Text(recipes.name,style: TextStyle(fontSize: 20,color: Colors.black),),
        backgroundColor: const Color.fromARGB(255, 255, 195, 232) ,
      ),
      body: 
      Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Center(child: Image.network(recipes.image,width: 350,height: 300,)),
               
                SizedBox(height: 50),
               Text("Name:${recipes.name}",style: TextStyle(fontSize: 20,color: Colors.black),),
              SizedBox(height: 15),
               Text("Cuisine:${recipes.cuisine}",style: TextStyle(fontSize: 15,color: Colors.black),),
                
              SizedBox(height: 20),
                Text("Ingredients:${recipes.ingredients}",style: TextStyle(fontSize: 15,),textAlign: TextAlign.justify,),
                 SizedBox(height: 20),
                  Text('Instrucations:${recipes.instructions}',style: TextStyle(fontSize: 15,),textAlign: TextAlign.justify,),
                  SizedBox(height: 20),
                  Text('Cooking Time:${recipes.cookTimeMinutes}',style: TextStyle(fontSize: 15,color: Colors.black),)
              ],
            ),
          ),
        ),
      )
       
    );
  }
}