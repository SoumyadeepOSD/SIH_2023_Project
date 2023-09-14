import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/pages/subcategories.dart';
import '../constant/colors.dart';
import '../constant/images.dart';
import '../constant/widgets.dart';

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
          "Provider Categories",
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
            myListTile(leading: advocate, title: "Advocate"),
            const SizedBox(height: 20.0),
            myListTile(leading: arbritrators, title: "Arbitrators"),
            const SizedBox(height: 20.0),
            myListTile(leading: mediators, title: "Mediators"),
            const SizedBox(height: 20.0),
            myListTile(leading: notaries, title: "Notaries"),
            const SizedBox(height: 20.0),
            myListTile(leading: writers, title: "Writers"),
            const SizedBox(height: 20.0),
            SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: green),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Subcategories(),
                  ));
                },
                child: customTextWidget(
                  "Continue",
                  16.0,
                  FontWeight.bold,
                  white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget myListTile({leading, title}) {
  return ListTile(
    selectedColor: green,
    contentPadding:
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
    tileColor: lightGrey,
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
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
  );
}
