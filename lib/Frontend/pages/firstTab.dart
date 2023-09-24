import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih_2023/Frontend/constant/colors.dart';
import 'package:sih_2023/Frontend/constant/images.dart';
import 'package:sih_2023/Frontend/constant/widgets.dart';
import 'package:sih_2023/Frontend/pages/auth/login.dart';
import 'package:sih_2023/Frontend/pages/register.dart';
import 'package:sih_2023/Frontend/pages/usermodel.dart';
import 'package:sih_2023/Frontend/states/generalState.dart';

class FirstTab extends StatelessWidget {
  const FirstTab({super.key});

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

              return Container(
                height: double.infinity,
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
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
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
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        20.0,
                                      ),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
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
                              iconWithText(advocate, "Advocates"),
                              const SizedBox(width: 10.0),
                              iconWithText(police, "Police Station"),
                              const SizedBox(width: 10.0),
                              iconWithText(hospital, "Hospitals"),
                              const SizedBox(width: 10.0),
                              iconWithText(pharma, "Pharmacies"),
                            ],
                          ),
                        )
                      ],
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
