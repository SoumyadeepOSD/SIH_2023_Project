import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/constant/images.dart';
import '../../constant/colors.dart';
import '../../constant/widgets.dart';

class LeaderboardClass {
  String name;
  String star;
  String img;
  LeaderboardClass({required this.name, required this.star, required this.img});
}

List<LeaderboardClass> leaderList = [
  LeaderboardClass(name: "Ajay Nagar", star: "4.9", img: lawyer1),
  LeaderboardClass(name: "Ashish Kumar", star: "4.8", img: lawyer2),
  LeaderboardClass(name: "Srija Haldar", star: "4.6", img: lawyer3),
  LeaderboardClass(name: "Amrit Singh", star: "4.6", img: lawyerface),
  LeaderboardClass(name: "Harshal Kanti", star: "4.4", img: lawyer5),
  LeaderboardClass(name: "Biswadeep Gupta", star: "4.3", img: lawyer6),
  LeaderboardClass(name: "Aman Dhanwan", star: "4.3", img: lawyer7),
  LeaderboardClass(name: "Krishnendu Roy", star: "4.2", img: lawyer8),
  LeaderboardClass(name: "Himadri Majhi", star: "3.7", img: lawyer9),
  LeaderboardClass(name: "Shivam Kumar", star: "3.5", img: lawyer10),
];

class UserLeaderBoard extends StatefulWidget {
  const UserLeaderBoard({super.key});

  @override
  State<UserLeaderBoard> createState() => _UserLeaderBoardState();
}

class _UserLeaderBoardState extends State<UserLeaderBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        title: customTextWidget(
          "Leaderboard",
          16.0,
          FontWeight.bold,
          white,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              customTextWidget(
                  "Top 10 lawyers of Bharat", 20.0, FontWeight.bold, black),
              const SizedBox(height: 20.0),
              Container(
                height: 500,
                child: ListView.builder(
                    itemCount: leaderList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: Image(
                              height: 50,
                              width: 50,
                              image: AssetImage(leaderList[index].img),
                            ),
                            title: customTextWidget(
                              leaderList[index].name,
                              14.0,
                              FontWeight.bold,
                              black,
                            ),
                            trailing: SizedBox(
                              width: 50,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: yellow,
                                  ),
                                  customTextWidget(
                                    leaderList[index].star,
                                    14.0,
                                    FontWeight.bold,
                                    black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(color: lightGrey, thickness: 1.0),
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
