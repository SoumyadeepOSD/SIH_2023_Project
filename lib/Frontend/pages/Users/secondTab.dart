import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/constant/images.dart';
import '../../constant/colors.dart';
import '../../constant/widgets.dart';
import 'providerDetails.dart';

TextEditingController _searchController = TextEditingController();

class ProviderDetailsTab {
  String name;
  String address;
  String image;
  String ratings;
  String id;
  String remark;
  String reviewname;
  String reviewimage;
  String reviewdesc;
  String designation;
  ProviderDetailsTab(
      {required this.name,
      required this.address,
      required this.image,
      required this.ratings,
      required this.id,
      required this.remark,
      required this.reviewname,
      required this.reviewimage,
      required this.reviewdesc,
      required this.designation});
}

List<ProviderDetailsTab> provideList = [
  ProviderDetailsTab(
      name: "Ajay Nagar",
      address: "Kolkata",
      image: lawyer1,
      ratings: "4.7",
      id: "WB56TQDS87",
      remark: "Best Lawyer",
      reviewname: "Rakesh Misra",
      reviewimage: maleface1,
      reviewdesc: "He is very nice",
      designation: "Lawyer"),
  ProviderDetailsTab(
      name: "Ashish Kumar",
      address: "Kolkata",
      image: lawyer2,
      ratings: "4.7",
      id: "WB56TQDS87",
      remark: "Best Lawyer",
      reviewname: "Rakesh Misra",
      reviewimage: maleface1,
      reviewdesc: "He is very nice",
      designation: "Mediators  "),
  ProviderDetailsTab(
      name: "Srija Haldar",
      address: "Kolkata",
      image: lawyer3,
      ratings: "4.5",
      id: "WB56TQDS87",
      remark: "Best Lawyer",
      reviewname: "Rakesh Misra",
      reviewimage: maleface1,
      reviewdesc: "He is very nice",
      designation: "Arbitrators"),
  ProviderDetailsTab(
      name: "Amrit Singh",
      address: "Kolkata",
      ratings: "4.3",
      image: lawyerface,
      id: "WB56TQDS87",
      remark: "Best Lawyer",
      reviewname: "Rakesh Misra",
      reviewimage: maleface1,
      reviewdesc: "He is very nice",
      designation: "Arbitrators"),
  ProviderDetailsTab(
      name: "Harshal Kanti",
      address: "Kolkata",
      ratings: "3.5",
      image: lawyer5,
      id: "WB56TQDS87",
      remark: "Best Lawyer",
      reviewname: "Rakesh Misra",
      reviewimage: maleface1,
      reviewdesc: "He is very nice",
      designation: "Notaries"),
  ProviderDetailsTab(
      name: "Biswadeep Gupta",
      address: "Kolkata",
      ratings: "4.0",
      image: lawyer6,
      id: "WB56TQDS87",
      remark: "Best Lawyer",
      reviewname: "Rakesh Misra",
      reviewimage: maleface1,
      reviewdesc: "He is very nice",
      designation: "Writers"),
  ProviderDetailsTab(
      name: "Aman Dhanwan",
      address: "Kolkata",
      ratings: "4.1",
      image: lawyer7,
      id: "WB56TQDS87",
      remark: "Best Lawyer",
      reviewname: "Rakesh Misra",
      reviewimage: maleface1,
      reviewdesc: "He is very nice",
      designation: "Notaries"),
  ProviderDetailsTab(
      name: "Krishnendu Roy",
      address: "Kolkata",
      ratings: "4.4",
      image: lawyer8,
      id: "WB56TQDS87",
      remark: "Best Lawyer",
      reviewname: "Rakesh Misra",
      reviewimage: maleface1,
      reviewdesc: "He is very nice",
      designation: "Lawyer"),
  ProviderDetailsTab(
      name: "Himadri Majhi",
      address: "Kolkata",
      ratings: "3.7",
      image: lawyer9,
      id: "WB56TQDS87",
      remark: "Best Lawyer",
      reviewname: "Rakesh Misra",
      reviewimage: maleface1,
      reviewdesc: "He is very nice",
      designation: "Writers"),
  ProviderDetailsTab(
      name: "Shivam Kumar",
      address: "Kolkata",
      ratings: "4.2",
      image: lawyer10,
      id: "WB56TQDS87",
      remark: "Best Lawyer",
      reviewname: "Rakesh Misra",
      reviewimage: maleface1,
      reviewdesc: "He is very nice",
      designation: "Lawyer"),
];

class SecondTab extends StatefulWidget {
  const SecondTab({super.key});

  @override
  State<SecondTab> createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  List<ProviderDetailsTab> filteredList = [];

  TextEditingController designationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initially, set the filteredList to the full list of providers
    filteredList = provideList;
  }

  // Filter function to filter providers by designation
  void filterByDesignation(String designation) {
    setState(() {
      filteredList = provideList
          .where((provider) => provider.designation == designation)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          color: white,
          height: 700,
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              TextField(
                controller: _searchController,
                onChanged: (value) {
                  filterByDesignation(value);
                },
                decoration: InputDecoration(
                  hintText: "Search Providers...",
                  hintStyle: TextStyle(color: customgrey),
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.blue.shade100,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: blue,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.all(10.0),
                color: lightGrey,
                height: 600,
                child: ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image(
                                    height: 50,
                                    width: 50,
                                    image:
                                        AssetImage(filteredList[index].image)),
                              ),
                              const SizedBox(width: 20.0),
                              customTextWidget(
                                filteredList[index].name,
                                16.0,
                                FontWeight.bold,
                                black,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customTextWidget(
                                filteredList[index].designation,
                                16.0,
                                FontWeight.bold,
                                black,
                              ),
                              Chip(
                                label: customTextWidget(
                                  filteredList[index].ratings,
                                  16.0,
                                  FontWeight.bold,
                                  black,
                                ),
                                avatar: Icon(
                                  Icons.star,
                                  color: yellow,
                                ),
                              ),
                              const SizedBox(width: 20.0),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ProviderDetails(),
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.info,
                                  color: black,
                                ),
                              )
                            ],
                          ),
                          Divider(
                            color: customgrey,
                            thickness: 1.0,
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
