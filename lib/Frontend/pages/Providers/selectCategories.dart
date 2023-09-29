import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/pages/Providers/subcategories.dart';
import '../../constant/colors.dart';
import '../../constant/images.dart';
import '../../constant/widgets.dart';

TextEditingController _controller = TextEditingController();

class SelectCategories extends StatelessWidget {
  const SelectCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: white,
          ),
        ),
        backgroundColor: black,
        title: customTextWidget(
          "Register",
          16.0,
          FontWeight.bold,
          white,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30.0),
            customTextWidget(
              "Select your categories",
              20.0,
              FontWeight.bold,
              black,
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              child: myListTile(leading: advocate, title: "Lawyers"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Subcategories(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20.0),
            myListTile(leading: arbritrators, title: "Arbitrators"),
            const SizedBox(height: 20.0),
            myListTile(leading: mediators, title: "Mediators"),
            const SizedBox(height: 20.0),
            myListTile(leading: notaries, title: "Notaries"),
            const SizedBox(height: 20.0),
            myListTile(leading: writers, title: "Writers"),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

Widget myListTile({leading, title}) {
  return Container(
    child: ListTile(
      selectedColor: green,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      tileColor: lightGrey,
      leading: Image(image: AssetImage(leading)),
      title: customTextWidget(
        title,
        16.0,
        FontWeight.bold,
        black,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_sharp,
        color: black,
      ),
    ),
  );
}
