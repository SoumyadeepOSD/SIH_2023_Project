import 'package:flutter/material.dart';

import '../../../SquareTitle.dart';
import '../../../app_style.dart';


class ThirdTab extends StatelessWidget {
  const ThirdTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites", style: h2Style)),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SquareTile(imagePath: 'assets/empty_favorite.png',),
              SizedBox(height: 10,),
              Text("Empty"),
              ]
          ),
        ),
      ),
    );
  }
}
