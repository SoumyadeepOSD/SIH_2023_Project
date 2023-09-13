import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'Frontend/constant/colors.dart';
import 'Frontend/constant/widgets.dart';
import 'Frontend/pages/register.dart';
import 'Frontend/pages/usermodel.dart';

class TestingImage extends StatefulWidget {
  const TestingImage({super.key});

  @override
  State<TestingImage> createState() => _TestingImageState();
}

class _TestingImageState extends State<TestingImage> {
  @override
  Widget build(BuildContext context) {
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
          "View Providers",
          16.0,
          FontWeight.bold,
          white,
        ),
      ),
      body: StreamBuilder<List<DistributorModel>>(
        stream: readProviders(),
        builder: (context, snapshotData) {
          if (snapshotData.hasError) {
            return const Text('Something went wrong!');
          } else if (snapshotData.hasData) {
            final users = snapshotData.data!;
            return FutureBuilder<List<String>>(
              future: fetchImages(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No images found.');
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        decoration: BoxDecoration(
                            color: lightGrey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0))),
                        child: ListTile(
                          leading: Image.network(
                            snapshot.data![index],
                            width: 50.0,
                            height: 50.0,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customTextWidget(users[index].firstName, 16.0,
                                  FontWeight.bold, black),
                              Chip(
                                label: Text(
                                  users[index].type.toString(),
                                  style: TextStyle(color: black),
                                ),
                                avatar: const Icon(
                                  Icons.work,
                                  color: Colors.red,
                                ),
                                backgroundColor: Colors.green.shade300,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    color: green,
                                    size: 20.0,
                                  ),
                                  customTextWidget(users[index].phoneNumber,
                                      14.0, FontWeight.w300, black),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: red,
                                    size: 20.0,
                                  ),
                                  customTextWidget(users[index].location, 14.0,
                                      FontWeight.bold, black),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            );
          } else {
            return const CircularProgressIndicator(); // Return a loading indicator here if neither hasError nor hasData is true.
          }
        },
      ),
    );
  }
}

// function to read images
Future<List<String>> fetchImages() async {
  List<String> imageUrls = [];
  try {
    final storage = FirebaseStorage.instance;
    final ListResult result = await storage.ref().child('images').listAll();
    for (final Reference reference in result.items) {
      final imageUrl = await reference.getDownloadURL();
      imageUrls.add(imageUrl);
    }
  } catch (e) {
    print('Error fetching images: $e');
  }
  return imageUrls;
}
