import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih_2023/Frontend/constant/colors.dart';
import 'package:sih_2023/Frontend/constant/images.dart';
import 'package:sih_2023/Frontend/constant/widgets.dart';
import 'package:sih_2023/Frontend/pages/Providers/community.dart';
import 'package:sih_2023/Frontend/pages/Users/usersLeaderboard.dart';
import 'package:sih_2023/Frontend/pages/auth/login.dart';
import 'package:sih_2023/Frontend/pages/Common/register.dart';
import 'package:sih_2023/Frontend/pages/Models/usermodel.dart';
import 'package:sih_2023/Frontend/states/generalState.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Common/selectType.dart';

final URL = Uri.parse('https://meet.google.com/ekm-vmjr-uxy');

class FirstTab extends StatefulWidget {
  const FirstTab({super.key});

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      body: Consumer<GeneralStateProvider>(
        builder: (context, providervalue, child) =>
            StreamBuilder<List<UserModel>>(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong!');
            } else if (snapshot.hasData) {
              final users = snapshot.data!;
              print(users[0].phoneName);
              providervalue.setUser(users[0].firstName, users[0].lastName,
                  user.email, users[0].phoneName);
              // Get location
              Future<void> reverseGeocode() async {
                LocationPermission permission =
                    await Geolocator.checkPermission();
                try {
                  if (permission == LocationPermission.denied ||
                      permission == LocationPermission.deniedForever) {
                    print("No permission is given");
                    await Geolocator.requestPermission();
                  } else {
                    Position currentPosition =
                        await Geolocator.getCurrentPosition(
                            desiredAccuracy: LocationAccuracy.best);
                    List<Placemark> placemarks = await placemarkFromCoordinates(
                      double.parse(currentPosition.latitude.toString()),
                      double.parse(currentPosition.longitude.toString()),
                    );
                    if (placemarks.isNotEmpty) {
                      Placemark placemark = placemarks[0];
                      String address =
                          "${placemark.name}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
                      print(address);
                      providervalue.setLocation(address);
                    } else {
                      print("No location information found");
                    }
                  }
                } catch (e) {
                  print("Error: $e");
                }
              }

              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: 1000,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        height: 30,
                        width: double.infinity,
                        child: ListView(
                          children: users.map(buildUser).toList(),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: InkWell(
                              onTap: () async {
                                reverseGeocode();
                              },
                              child: Chip(
                                label: Text(providervalue.location == null
                                    ? 'Your Location'
                                    : providervalue.location!),
                                avatar: Icon(
                                  Icons.location_on,
                                  color: red,
                                ),
                              ),
                            ),
                          ),
                          //========================Depreciated=================================================================================
                          // customTextWidget(
                          //     user.email, 16.0, FontWeight.bold, black),
                          // ElevatedButton(
                          //   onPressed: () {
                          //     logout(context: context);
                          //   },
                          //   child: const Text("Logout"),
                          // ),
                          // // View all providers
                          // ElevatedButton(
                          //   onPressed: () {
                          //     Navigator.of(context).push(
                          //       MaterialPageRoute(
                          //         builder: (context) => const TestingImage(),
                          //       ),
                          //     );
                          //   },
                          //   child: const Text("View Providers"),
                          // ),
                          //========================Depreciated================================================================================
                          // CurouselSlider
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 100.0,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                            ),
                            // CurouselSlider
                            items: [
                              firstCard,
                              secondCard,
                              thirdCard,
                              fourthCard,
                              fifthCard
                            ].map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 10.0),
                                    decoration: const BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          20.0,
                                        ),
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          20.0,
                                        ),
                                      ),
                                      child: Image(
                                        image: AssetImage(i),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          customTextWidget(
                              "Providers", 16.0, FontWeight.bold, black),
                          const SizedBox(
                            height: 10.0,
                          ),
                          // Service Providers Icons
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            width: double.infinity,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: [
                                const SizedBox(width: 10.0),
                                InkWell(
                                  child: iconWithText(advocate, "Advocates"),
                                  onTap: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         const SelectTypes(),
                                    //   ),
                                    // );
                                  },
                                ),
                                const SizedBox(width: 10.0),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const UserLeaderBoard(),
                                      ),
                                    );
                                  },
                                  child:
                                      iconWithText(leaderboard, "Leaderboard"),
                                ),
                                const SizedBox(width: 10.0),
                                iconWithText(legalaid, "Legal aid"),
                                const SizedBox(width: 10.0),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Community(),
                                      ),
                                    );
                                  },
                                  child: iconWithText(
                                    communityLogo,
                                    "Community",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          customTextWidget("Your upcoming appointment(s)", 16.0,
                              FontWeight.bold, black),
                          const SizedBox(height: 10.0),
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: lightGrey,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 120,
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        child: const Image(
                                          fit: BoxFit.fill,
                                          height: 100,
                                          width: 100,
                                          image: AssetImage(
                                            lawyer1,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          customTextWidget("Amit Trivedi", 16.0,
                                              FontWeight.bold, customgrey),
                                          const SizedBox(width: 10.0),
                                          Chip(
                                            backgroundColor:
                                                Colors.blue.shade200,
                                            label: customTextWidget("4.5", 16.0,
                                                FontWeight.bold, blue),
                                            avatar: Icon(
                                              Icons.star,
                                              color: yellow,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                customTextWidget("23rd october 2023 || 12:30pm",
                                    16.0, FontWeight.bold, blue),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  width: double.infinity,
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: red),
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.cancel,
                                          color: white,
                                        ),
                                        label: customTextWidget("Cancel", 14.0,
                                            FontWeight.bold, white),
                                      ),
                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: blue),
                                        onPressed: () => setState(() {
                                          launchUrl(URL,
                                              mode: LaunchMode
                                                  .externalApplication);
                                        }),
                                        icon: Icon(
                                          Icons.video_call,
                                          color: white,
                                        ),
                                        label: customTextWidget("Join", 14.0,
                                            FontWeight.bold, white),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

Future logout({context}) async {
  await FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const Login(),
    ),
  );
}
