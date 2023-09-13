import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/constant/colors.dart';
import 'package:sih_2023/Frontend/constant/widgets.dart';
import 'package:sih_2023/Frontend/pages/register.dart';
import 'package:sih_2023/Frontend/pages/usermodel.dart';

class ServiceProviders extends StatelessWidget {
  const ServiceProviders({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: white,
          ),
        ),
        backgroundColor: black,
        title: customTextWidget(
          "Service Providers",
          16.0,
          FontWeight.bold,
          white,
        ),
      ),
      body: StreamBuilder<List<DistributorModel>>(
        stream: readProviders(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong!');
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return Container(
              height: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    height: MediaQuery.of(context).size.height - 500,
                    child: ListView(
                      children: users.map(buildProvider).toList(),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                        future: _loadImages(),
                        builder: (context, snapshotImage) {
                          try {
                            print(snapshotImage.data);
                          } catch (e) {
                            print(e);
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Widget buildProvider(DistributorModel user) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    decoration: BoxDecoration(
      color: lightGrey,
      borderRadius: const BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    child: Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customTextWidget(user.firstName!, 16.0, FontWeight.bold, black),
              customTextWidget(user.type!, 16.0, FontWeight.w500, black),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customTextWidget(user.phoneNumber!, 14.0, FontWeight.w500, black),
              customTextWidget(user.location!, 12.0, FontWeight.bold, black),
            ],
          ),
        ),
      ],
    ),
  );
}

// =====================show images with list==================
Future _loadImages() async {
  List<Map<String, dynamic>> files = [];

  final ListResult result = await FirebaseStorage.instance.ref().list();
  final List<Reference> allFiles = result.items;

  await Future.forEach<Reference>(allFiles, (file) async {
    final String fileUrl = await file.getDownloadURL();
    files.add({
      "url": fileUrl,
      "path": file.fullPath,
    });
  });

  return files;
}
