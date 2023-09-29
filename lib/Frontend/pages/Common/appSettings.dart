import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih_2023/Frontend/pages/Users/firstTab.dart';
import 'package:sih_2023/Frontend/states/generalState.dart';
import '../../constant/colors.dart';
import '../../constant/widgets.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("English"), value: "English"),
    DropdownMenuItem(child: Text("हिंदी"), value: "हिंदी"),
    DropdownMenuItem(child: Text("বাংলা"), value: "বাংলা"),
    DropdownMenuItem(child: Text("தமிழ்"), value: "தமிழ்"),
  ];
  return menuItems;
}

String selectedValue = "English";

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: white,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: black,
        title: customTextWidget(
          "Settings",
          16.0,
          FontWeight.bold,
          white,
        ),
      ),
      body: Consumer<GeneralStateProvider>(
        builder: (context, userProviderValue, child) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              ListTile(
                tileColor: lightGrey,
                leading: Icon(
                  Icons.contacts_sharp,
                  color: black,
                ),
                title: customTextWidget(
                    "User Profile", 16.0, FontWeight.bold, black),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                color: lightGrey,
                child: Column(
                  children: [
                    ListTile(
                      leading: customTextWidget(
                          "Name", 14.0, FontWeight.bold, black),
                      title: customTextWidget(
                          userProviderValue.userFName.toString() +
                              "\t" +
                              userProviderValue.userLName.toString(),
                          14.0,
                          FontWeight.w500,
                          customgrey),
                    ),
                    ListTile(
                      leading: customTextWidget(
                          "Email", 14.0, FontWeight.bold, black),
                      title: customTextWidget(
                          userProviderValue.userEmail.toString(),
                          14.0,
                          FontWeight.w500,
                          customgrey),
                    ),
                    ListTile(
                      leading: customTextWidget(
                          "Phone", 14.0, FontWeight.bold, black),
                      title: customTextWidget(
                          userProviderValue.userPhNo.toString(),
                          14.0,
                          FontWeight.w500,
                          customgrey),
                    ),
                    ListTile(
                      leading: customTextWidget(
                          "Location", 14.0, FontWeight.bold, black),
                      title: customTextWidget(
                          userProviderValue.location.toString(),
                          14.0,
                          FontWeight.w500,
                          customgrey),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                isExpanded: true,
                value: selectedValue,
                items: dropdownItems,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: red,
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                ),
                onPressed: () {
                  logout(context: context);
                },
                child: customTextWidget(
                  "Logout",
                  16.0,
                  FontWeight.bold,
                  white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
