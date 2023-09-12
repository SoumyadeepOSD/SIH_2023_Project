// import 'package:flutter/material.dart';
// import 'package:sih_2023/Frontend/pages/usermodel.dart';

// import '../constant/colors.dart';
// import '../constant/widgets.dart';

// class ServiceProviders extends StatefulWidget {
//   const ServiceProviders({super.key});

//   @override
//   State<ServiceProviders> createState() => _ServiceProvidersState();
// }

// class _ServiceProvidersState extends State<ServiceProviders> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// appBar: AppBar(
//   leading: InkWell(
//     onTap: () {
//       Navigator.of(context).pop();
//     },
//     child: Icon(
//       Icons.arrow_back_ios,
//       color: white,
//     ),
//   ),
//   backgroundColor: black,
//   title: customTextWidget(
//     "Service Providers",
//     16.0,
//     FontWeight.bold,
//     white,
//   ),
// ),
//       body: StreamBuilder<List<DistributorModel>>(
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return const Text('Something went wrong!');
//           } else if (snapshot.hasData) {
//             final providers = snapshot.data!;
//             return Container(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 200,
//                     width: double.infinity,
//                     child: ListView(
//                       children: providers.map(buildProvider).toList(),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//           else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
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
              customTextWidget("${user.firstName!} ${user.lastName!}", 16.0,
                  FontWeight.bold, black),
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
