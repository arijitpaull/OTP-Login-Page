import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Image.asset('assets/flyinlogo.png', width: 75,),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.notifications),
            color:const Color.fromARGB(255, 136, 122, 0),
          )
        ],
      ),
    );
  }
}