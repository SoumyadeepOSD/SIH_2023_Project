import 'package:flutter/material.dart';

import '../constants.dart';



class ArticleDesc extends StatelessWidget {
  final int index;
  ArticleDesc({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[200],
              backgroundImage: NetworkImage(imageSliders[index]),
            ),
            title: Text(
              "Daily Life",
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Protecting each other at work in markets",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[100],
              child: Center(
                child: Image.asset("assets/un.png"),
              ),
            ),
            title: Text("UN WOMEN"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(articles[0][0]),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(articles[0][1]),
          ),
        ],
      ),
    );
  }
}

class ArticleImage extends StatelessWidget {
  final String imageStr;
  const ArticleImage({required Key key, required this.imageStr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width - 20,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(
                  imageStr,
                  //"https://www.unwomen.org/-/media/headquarters/images/sections/news/stories/2018/8/tanzania_daressalaam_bettyjaphet-mtewelle_mchikinimarketvendor_august2018_002_1_960x640.jpg?la=en&vs=4847",
                ),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}