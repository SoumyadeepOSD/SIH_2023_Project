import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../constants.dart';

class SafeWebView extends StatelessWidget {
  final String url;
  final String title;
  final int index;
  const SafeWebView({Key? key, required this.url, required this.title, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(title),
        trailing: CircleAvatar(
          backgroundColor: Colors.grey[200],
          backgroundImage: NetworkImage(imageSliders[index]),
        ),
      ),
    );
  }
}