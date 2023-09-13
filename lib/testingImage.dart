import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Frontend/constant/colors.dart';
import 'Frontend/constant/widgets.dart';
import 'Frontend/pages/register.dart';
import 'Frontend/pages/usermodel.dart';
import 'Frontend/states/categoryState.dart';

TextEditingController _controller = TextEditingController();

class TestingImage extends StatefulWidget {
  const TestingImage({super.key});

  @override
  State<TestingImage> createState() => _TestingImageState();
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "Lawyer", child: Text("Lawyer")),
    const DropdownMenuItem(value: "Munsi", child: Text("Munsi")),
    const DropdownMenuItem(value: "Writer", child: Text("Writer")),
    const DropdownMenuItem(value: "Distributor", child: Text("Distributor")),
  ];
  return menuItems;
}

String selectedValue = "Distributor";

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
            List users = snapshotData.data!;
            return FutureBuilder<List<String>>(
              future: fetchImages(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No images found.');
                } else {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: ChangeNotifierProvider<CategoryProvider>(
                        create: (context) => CategoryProvider(),
                        child: Consumer<CategoryProvider>(
                          builder: (context, providerValue, child) {
                            return Column(
                              children: [
                                DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor: lightGrey,
                                  ),
                                  dropdownColor: const Color(0xFFA4C4FC),
                                  value: selectedValue,
                                  items: dropdownItems,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      providerValue.category = newValue!;
                                      selectedValue = newValue!;
                                      if (providerValue.category == 'Lawyer') {
                                        providerValue.toogleLawyer();
                                      } else if (providerValue.category ==
                                          'Munsi') {
                                        providerValue.toogleMunsi();
                                      } else if (providerValue.category ==
                                          'Writer') {
                                        providerValue.toogleWriter();
                                      } else if (providerValue.category ==
                                          'Distributor') {
                                        providerValue.toogleDistributor();
                                        print(
                                            "tu meri jan, me teri pran,........");
                                        print(newValue);
                                      }
                                      print(providerValue.category);
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Container(
                                    color: blue,
                                    height: 500,
                                    child: ListView.builder(
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        return users[index].type.toString() ==
                                                selectedValue
                                            ? Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20.0,
                                                        vertical: 10.0),
                                                decoration: BoxDecoration(
                                                    color: lightGrey,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                8.0))),
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: ListTile(
                                                    leading: Image.network(
                                                      snapshot.data![index],
                                                      width: 50.0,
                                                      height: 50.0,
                                                    ),
                                                    title: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        customTextWidget(
                                                            users[index]
                                                                .firstName,
                                                            16.0,
                                                            FontWeight.bold,
                                                            black),
                                                        Chip(
                                                          label: Text(
                                                            users[index]
                                                                .type
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: black),
                                                          ),
                                                          avatar: const Icon(
                                                            Icons.work,
                                                            color: Colors.red,
                                                          ),
                                                          backgroundColor:
                                                              Colors.green
                                                                  .shade300,
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 5,
                                                                  horizontal:
                                                                      10),
                                                        ),
                                                      ],
                                                    ),
                                                    subtitle: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.call,
                                                              color: green,
                                                              size: 20.0,
                                                            ),
                                                            customTextWidget(
                                                                users[index]
                                                                    .phoneNumber,
                                                                14.0,
                                                                FontWeight.w300,
                                                                black),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .location_on_outlined,
                                                              color: red,
                                                              size: 20.0,
                                                            ),
                                                            customTextWidget(
                                                                users[index]
                                                                    .location,
                                                                14.0,
                                                                FontWeight.bold,
                                                                black),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container();
                                      },
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
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
}
