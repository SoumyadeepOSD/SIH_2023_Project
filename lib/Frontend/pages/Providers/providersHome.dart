import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sih_2023/Frontend/pages/Providers/providersProfile.dart';
import '../../constant/colors.dart';
import '../../constant/images.dart';
import '../../constant/widgets.dart';
import '../../states/generalState.dart';

final URL = Uri.parse('https://meet.google.com/ekm-vmjr-uxy');

class informationClass {
  String id;
  String name;
  String image;
  String location;
  String topic;
  bool status;
  String datetime;
  String? meettime;
  informationClass(
      {required this.id,
      required this.name,
      required this.image,
      required this.location,
      required this.topic,
      required this.status,
      required this.datetime,
      this.meettime});
}

List<informationClass> ongoingList = [
  informationClass(
      id: "SF6VBH671vREDhdsd6",
      name: "Ajay Khanna",
      image: maleface1,
      location: "Mumbai",
      topic: "Land related issue in Mumbai city",
      datetime: "Oct 12, 2022 || 11:00 AM",
      status: true),
  informationClass(
      id: "SF6VBH671vREDhdsd6",
      name: "Nikita Sharma",
      image: femaleface,
      location: "Pune",
      topic: "House registery related issue at my local area",
      datetime: "Oct 12, 2022 || 11:00 AM",
      status: true),
  informationClass(
      id: "SF6VBH671vREDhdsd6",
      name: "Rohit Debey",
      image: maleface2,
      location: "Delhi",
      topic:
          "My wife gave sudden divorce due to talk with my college female friend",
      datetime: "Oct 12, 2022 || 11:00 AM",
      status: true)
];

List<informationClass> upcomingList = [
  informationClass(
      id: "SF6VBH671vREDhdsd6",
      name: "Raghav Jadav",
      image: maleface1,
      location: "Bihar",
      topic: "Land related issue in Mumbai city",
      datetime: "Oct 12, 2022 || 11:00 AM",
      status: true),
  informationClass(
      id: "SF6VBH671vREDhdsd6",
      name: "Susmita Mukherjee",
      image: femaleface,
      location: "Kolkata",
      topic: "House registery related issue at my local area",
      datetime: "Oct 12, 2022 || 11:00 AM",
      status: true),
  informationClass(
      id: "SF6VBH671vREDhdsd6",
      name: "Md. Aquib Ahmed",
      image: maleface2,
      location: "Bangalore",
      topic:
          "My wife gave sudden divorce due to talk with my college female friend",
      datetime: "Oct 12, 2022 || 11:00 AM",
      status: true)
];

List<informationClass> historyList = [
  informationClass(
      id: "SF6VBH671vREDhdsd6",
      name: "Rakesh Mishra",
      image: maleface1,
      location: "Mumbai",
      topic: "Land related issue in Mumbai city",
      datetime: "Oct 12, 2022 || 11:00 AM",
      meettime: null,
      status: false),
  informationClass(
      id: "SF6VBH671vREDhdsd6",
      name: "Rishita Kumar",
      image: femaleface,
      location: "Pune",
      topic: "House registery related issue at my local area",
      datetime: "Oct 12, 2022 || 11:00 AM",
      meettime: "1.4 hrs",
      status: true),
  informationClass(
      id: "SF6VBH671vREDhdsd6",
      name: "Asif Ansari",
      image: maleface2,
      location: "Delhi",
      topic:
          "My wife gave sudden divorce due to talk with my college female friend",
      datetime: "Oct 12, 2022 || 11:00 AM",
      meettime: "26 mins",
      status: true),
  informationClass(
      id: "SF6VBH671vREDhdsd6",
      name: "Kunal Kushal",
      image: maleface1,
      location: "Mumbai",
      topic: "Land related issue in Mumbai city",
      datetime: "Oct 12, 2022 || 11:00 AM",
      meettime: null,
      status: false),
  informationClass(
      id: "SF6VBH671vREDhdsd6",
      name: "Srija Agarwal",
      image: femaleface,
      location: "Pune",
      topic: "House registery related issue at my local area",
      datetime: "Oct 12, 2022 || 11:00 AM",
      meettime: null,
      status: false),
  informationClass(
      id: "SF6VBH671vREDhdsd6",
      name: "Deepak Hazra",
      image: maleface2,
      location: "Delhi",
      topic:
          "My wife gave sudden divorce due to talk with my college female friend",
      datetime: "Oct 12, 2022 || 11:00 AM",
      meettime: "30 mins",
      status: true)
];

class notificationClass {
  String title;
  String datetime;
  notificationClass({required this.title, required this.datetime});
}

List<notificationClass> notificationList = [
  notificationClass(
      title: "Ajay paid ₹12000", datetime: "23 Aug 2023 | 10:00 AM"),
  notificationClass(
      title: "You've appeared in 200+ search result",
      datetime: "12 Aug 2023 | 13:30 PM"),
  notificationClass(
      title: "Want more client? Join this community",
      datetime: "25 Aug 2023 | 09:36 AM"),
  notificationClass(
      title: "Meeting with raghu will start within 1hr", datetime: "Now"),
];

class ProvidersHome extends StatefulWidget {
  const ProvidersHome({super.key});

  @override
  State<ProvidersHome> createState() => _ProvidersHomeState();
}

class _ProvidersHomeState extends State<ProvidersHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProvidersProfile(),
                ),
              );
            },
            icon: Icon(
              Icons.perm_contact_calendar_rounded,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              _popUpSheet(context);
            },
            icon: Icon(
              Icons.notifications_active,
              color: Colors.yellow,
            ),
          )
        ],
        leading: InkWell(
          onTap: () {},
          child: Icon(
            Icons.arrow_back,
            color: black,
          ),
        ),
        backgroundColor: black,
        title: customTextWidget(
          "Bharat विधि",
          16.0,
          FontWeight.bold,
          white,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer<GeneralStateProvider>(
          builder: (context, providervalue, child) => Container(
            color: white,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                // Top section of home
                const SizedBox(height: 20),
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        iconWithText(community, "Community"),
                        iconWithText(leaderboard, "Leaderboard"),
                        iconWithText(caseStatus, "Case Status"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    children: [
                      const SizedBox(width: 20.0),
                      Buttons(
                          title: "Ongoing",
                          flag: providervalue.ongoing,
                          providerValue: providervalue),
                      const SizedBox(width: 20.0),
                      Buttons(
                          title: "Upcoming",
                          flag: providervalue.upcoming,
                          providerValue: providervalue),
                      const SizedBox(width: 20.0),
                      Buttons(
                          title: "History",
                          flag: providervalue.history,
                          providerValue: providervalue),
                    ],
                  ),
                ),
                // Top section of home end
                // Depeding upon the state, here is the main body
                const SizedBox(
                  height: 50.0,
                ),
                // **start**
                providervalue.ongoing == true
                    ? ongoingSection(setState: setState)
                    : providervalue.upcoming == true
                        ? upcomingSection(setState: setState)
                        : historySection(setState: setState),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Separately made buttons for reducing the code
// **Button starts here**
Widget Buttons({title, flag, providerValue}) {
  return ElevatedButton(
    style:
        ElevatedButton.styleFrom(backgroundColor: flag == true ? green : black),
    onPressed: () {
      title == 'Ongoing'
          ? providerValue.onGoingState()
          : title == 'Upcoming'
              ? providerValue.upComingState()
              : providerValue.historyState();
    },
    child: customTextWidget(title, 14.0, FontWeight.bold, white),
  );
}
// **Button Ends here**

// Ongoing Widget of home section of providers
// **start**
Widget ongoingSection({setState}) {
  return SingleChildScrollView(
    child: Container(
      height: 600,
      child: ListView.builder(
        itemCount: ongoingList.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: lightGrey, width: 2.0),
                  ),
                  width: double.infinity,
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: customTextWidget(
                            'Case ID: ${upcomingList[index].id}',
                            14.0,
                            FontWeight.bold,
                            black),
                      ),
                      ListTile(
                        leading: Image(
                          image: AssetImage(ongoingList[index].image),
                        ),
                        title: customTextWidget(ongoingList[index].name, 14.0,
                            FontWeight.bold, black),
                        subtitle: customTextWidget(ongoingList[index].location,
                            14.0, FontWeight.bold, black),
                        trailing: Icon(
                          Icons.call,
                          color: green,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Chip(
                          backgroundColor: Colors.lightGreen.shade300,
                          label: customTextWidget(ongoingList[index].topic,
                              14.0, FontWeight.bold, black),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: customTextWidget(ongoingList[index].datetime,
                            12.0, FontWeight.w900, black),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: red),
                              onPressed: () {},
                              icon: Icon(
                                Icons.cancel,
                                color: white,
                              ),
                              label: customTextWidget(
                                  "Cancel", 14.0, FontWeight.bold, white),
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: blue),
                              onPressed: () => setState(() {
                                launchUrl(URL,
                                    mode: LaunchMode.externalApplication);
                              }),
                              icon: Icon(
                                Icons.video_call,
                                color: white,
                              ),
                              label: customTextWidget(
                                  "Join", 14.0, FontWeight.bold, white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30.0),
              ],
            ),
          );
        },
      ),
    ),
  );
}
// **End**

// Upcoming Widget of home section of providers
// **start**
Widget upcomingSection({setState}) {
  return SingleChildScrollView(
    child: Container(
      height: 600,
      child: ListView.builder(
        itemCount: upcomingList.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: lightGrey, width: 2.0),
                  ),
                  width: double.infinity,
                  height: 280,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: customTextWidget(
                            'Case ID: ${upcomingList[index].id}',
                            14.0,
                            FontWeight.bold,
                            black),
                      ),
                      ListTile(
                        leading: Image(
                          image: AssetImage(upcomingList[index].image),
                        ),
                        title: customTextWidget(upcomingList[index].name, 14.0,
                            FontWeight.bold, black),
                        subtitle: customTextWidget(upcomingList[index].location,
                            14.0, FontWeight.bold, black),
                        trailing: Icon(
                          Icons.call,
                          color: green,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Chip(
                          backgroundColor: Colors.lightGreen.shade300,
                          label: customTextWidget(upcomingList[index].topic,
                              14.0, FontWeight.bold, black),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: customTextWidget(ongoingList[index].datetime,
                            12.0, FontWeight.w900, black),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: red),
                              onPressed: () {},
                              icon: Icon(
                                Icons.cancel,
                                color: white,
                              ),
                              label: customTextWidget(
                                  "Cancel", 14.0, FontWeight.bold, white),
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: green),
                              onPressed: () {},
                              icon: Icon(
                                Icons.done_rounded,
                                color: white,
                              ),
                              label: customTextWidget(
                                  "Accept", 14.0, FontWeight.bold, white),
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: blue),
                              onPressed: () => setState(() {
                                launchUrl(URL,
                                    mode: LaunchMode.externalApplication);
                              }),
                              icon: Icon(
                                Icons.video_call,
                                color: white,
                              ),
                              label: customTextWidget(
                                  "Join", 14.0, FontWeight.bold, white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30.0),
              ],
            ),
          );
        },
      ),
    ),
  );
}
// **End**

// History Widget of home section of providers
// **start**
Widget historySection({setState}) {
  return SingleChildScrollView(
    child: Container(
      height: 600,
      child: ListView.builder(
        itemCount: historyList.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: lightGrey, width: 2.0),
                  ),
                  width: double.infinity,
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: customTextWidget(
                            'Case ID: ${historyList[index].id}',
                            14.0,
                            FontWeight.bold,
                            black),
                      ),
                      ListTile(
                        leading: Image(
                          image: AssetImage(historyList[index].image),
                        ),
                        title: customTextWidget(historyList[index].name, 14.0,
                            FontWeight.bold, black),
                        subtitle: SizedBox(
                          width: 200,
                          child: Row(
                            children: [
                              customTextWidget(historyList[index].location,
                                  14.0, FontWeight.bold, black),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Chip(
                                  backgroundColor: Colors.lightGreen.shade50,
                                  label: customTextWidget(
                                      historyList[index].status
                                          ? "Successful"
                                          : "Cancelled",
                                      14.0,
                                      FontWeight.bold,
                                      historyList[index].status ? green : red),
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: Icon(
                          Icons.call,
                          color: green,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Chip(
                          backgroundColor: Colors.lightGreen.shade300,
                          label: customTextWidget(historyList[index].topic,
                              14.0, FontWeight.bold, black),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: customTextWidget(
                            historyList[index].status
                                ? 'Consultanted: ${historyList[index].meettime}'
                                : "",
                            14.0,
                            FontWeight.w500,
                            green),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30.0),
              ],
            ),
          );
        },
      ),
    ),
  );
}
// **End**

// **_popUpSheet**
void _popUpSheet(context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 1200,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: notificationList.length,
          itemBuilder: (context, index) {
            return Column(children: [
              ListTile(
                title: customTextWidget(notificationList[index].title, 14.0,
                    FontWeight.w500, black),
                subtitle: customTextWidget(notificationList[index].datetime,
                    12.0, FontWeight.w500, customgrey),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(
                  thickness: 1.0,
                  color: lightGrey,
                ),
              )
            ]);
          },
        ),
      );
    },
  );
}
