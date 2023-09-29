import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/constant/images.dart';
import '../../constant/colors.dart';
import '../../constant/widgets.dart';

class personalInformation {
  String trailing;
  String leading;
  personalInformation({required this.trailing, required this.leading});
}

List<personalInformation> personalList = [
  personalInformation(trailing: "+91-8910902078", leading: "Mobile"),
  personalInformation(trailing: "Newtown, Kolkata - 69", leading: "Address"),
  personalInformation(
      trailing: "5+", leading: "Years of exp."), //*Years of exp*/
  personalInformation(
      trailing: "32", leading: "Cases handled"), //*no. of cases*/
  personalInformation(trailing: "7689 6789 4215 2562", leading: "Aadhaar no."),
  personalInformation(trailing: "WBZM25241CL", leading: "PAN no."),
  personalInformation(trailing: "WBLDM6TNCP0", leading: "Govt. issued Id"),
  personalInformation(
      trailing: "Calcutta University", leading: "Graduated from"),
  personalInformation(trailing: "1996", leading: "Graduation year"),
  personalInformation(trailing: "Lawyer", leading: "Occupation"),
];

class ProvidersProfile extends StatelessWidget {
  const ProvidersProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: white,
            ),
          ),
          backgroundColor: black,
          title: customTextWidget(
            "Profile",
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
                    "Personal Information", 24.0, FontWeight.bold, black),
                const SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                    color: lightGrey,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image(
                          height: 150,
                          width: 150,
                          image: AssetImage(lawyerface),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: Column(
                          children: [
                            customTextWidget(
                                "Amrit Singh", 20.0, FontWeight.bold, black),
                            Chip(
                              label: customTextWidget(
                                  "4.5", 20.0, FontWeight.bold, black),
                              avatar: Icon(
                                Icons.star,
                                color: yellow,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                // *Progress bar section starts*
                customTextWidget(
                    "You're ahead from", 20.0, FontWeight.bold, black),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      TweenAnimationBuilder(
                        duration: Duration(seconds: 5),
                        tween: Tween(begin: 0.0, end: 0.7),
                        builder: (context, value, _) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: CircularProgressIndicator(
                                  value: value,
                                  backgroundColor: lightGrey,
                                  strokeWidth: 8,
                                ),
                              ),
                              Text(
                                '${(value * 100).toInt()}%',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 10.0),
                      Chip(
                        backgroundColor: Colors.blue.shade50,
                        label: customTextWidget(
                            "State level", 14.0, FontWeight.bold, blue),
                      ),
                    ]),
                    Column(children: [
                      TweenAnimationBuilder(
                        duration: Duration(seconds: 5),
                        tween: Tween(begin: 0.0, end: 0.52),
                        builder: (context, value, _) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: CircularProgressIndicator(
                                  value: value,
                                  backgroundColor: lightGrey,
                                  strokeWidth: 8,
                                ),
                              ),
                              Text(
                                '${(value * 100).toInt()}%',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 10.0),
                      Chip(
                        backgroundColor: Colors.green.shade50,
                        label: customTextWidget(
                            "National level", 14.0, FontWeight.bold, green),
                      ),
                    ]),
                  ],
                ),

                customTextWidget(
                    "Your general information", 20.0, FontWeight.bold, black),
                const SizedBox(height: 10.0),
                // *Progress bar section ends*
                // *General information starts*
                Container(
                  height: 400,
                  child: ListView.builder(
                    itemCount: personalList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customTextWidget(personalList[index].leading,
                                  14.0, FontWeight.bold, black),
                              customTextWidget(
                                  personalList[index].trailing,
                                  14.0,
                                  FontWeight.bold,
                                  Colors.blueGrey.shade600)
                            ],
                          ),
                          const SizedBox(height: 20.0),
                        ],
                      );
                    },
                  ),
                ),
                // *General information ends*
              ],
            ),
          ),
        ));
  }
}
