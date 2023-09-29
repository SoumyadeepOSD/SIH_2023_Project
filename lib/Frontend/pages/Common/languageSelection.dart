import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih_2023/Frontend/pages/Common/selectType.dart';
import '../../constant/colors.dart';
import '../../constant/widgets.dart';
import '../../states/generalState.dart';

List<String> languages = [
  "English",
  "हिंदी",
  "বাংলা",
  "தமிழ்",
  "اردو",
  "मराठी",
  "മലയാളം"
];

class LanguageSelection extends StatefulWidget {
  const LanguageSelection({super.key});

  @override
  State<LanguageSelection> createState() => _LanguageSelectionState();
}

int selectedIndex = -1;

class _LanguageSelectionState extends State<LanguageSelection> {
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
          "Bharat विधि",
          16.0,
          FontWeight.bold,
          white,
        ),
      ),
      body: Consumer<GeneralStateProvider>(
        builder: (context, value, child) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              customTextWidget(
                "Please select your Language",
                16.0,
                FontWeight.bold,
                black,
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final itemText = languages[index];
                    return GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            // Update the selected index when an item is tapped
                            selectedIndex = index;
                            value.setLang(
                              selectedIndex,
                            );
                            print(value.language);
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: selectedIndex == index
                              ? Colors.blue.shade200
                              : Colors.white,
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                itemText,
                                style: TextStyle(
                                    fontWeight: selectedIndex == index
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                              // other ListTile properties
                            ),
                            Divider(
                              color: Colors
                                  .grey.shade200, // Adjust the color as needed
                              thickness: 1.0, // Adjust the thickness as needed
                              height: 0, // Adjust the height as needed
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              value.language! > -1
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: green),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectTypes(),
                          ),
                        );
                      },
                      child: customTextWidget(
                        "Select",
                        14.0,
                        FontWeight.bold,
                        white,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
