import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/constant/images.dart';
import '../../constant/colors.dart';
import '../../constant/widgets.dart';

class community {
  String leading;
  String name;
  community({required this.leading, required this.name});
}

List<community> communityList = [
  community(leading: whatsppLogo, name: "Whatsapp"),
  community(leading: facebookLogo, name: "Facebook"),
  community(leading: twitterLogo, name: "Twitter"),
  community(leading: customcommunityLogo, name: "Custom"),
];

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        title: customTextWidget(
          "Community",
          16.0,
          FontWeight.bold,
          white,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        height: 500,
        width: double.infinity,
        child: Column(
          children: [
            customTextWidget(
              "Expand your presence, help more",
              16.0,
              FontWeight.bold,
              green,
            ),
            const SizedBox(height: 40.0),
            Container(
              height: 400,
              child: ListView.separated(
                itemCount: communityList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(); // Add a Divider between list items
                },
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image(
                      image: AssetImage(
                        communityList[index].leading,
                      ),
                    ),
                    title: customTextWidget(
                      communityList[index].name,
                      16.0,
                      FontWeight.bold,
                      black,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
