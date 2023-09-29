import 'package:flutter/material.dart';
import 'package:sih_2023/Frontend/pages/Providers/providersHome.dart';
import '../../constant/colors.dart';
import '../../constant/images.dart';
import '../../constant/widgets.dart';

TextEditingController _phonecontroller = TextEditingController();
TextEditingController _addresscontroller = TextEditingController();
TextEditingController _expcontroller = TextEditingController();
TextEditingController _universitycontroller = TextEditingController();
TextEditingController _registerIdcontroller = TextEditingController();
TextEditingController _casenumbercontroller = TextEditingController();

class Subcategories extends StatelessWidget {
  const Subcategories({super.key});

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
          "Sub-Categories",
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
              Center(
                child: customTextWidget(
                  "Please insert your details carefully",
                  20.0,
                  FontWeight.bold,
                  black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Image(
                    height: 100,
                    width: 100,
                    image: AssetImage(addImage),
                  ),
                  customTextWidget(
                    "Upload your image!",
                    20.0,
                    FontWeight.bold,
                    black,
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              customTextWidget(
                  "You're registering as lawyer", 14.0, FontWeight.w300, red),
              const SizedBox(height: 10.0),
              customTextField(
                  controllerName: _phonecontroller,
                  hint: "Enter your Mobile Number"),
              const SizedBox(height: 20.0),
              customTextField(
                  controllerName: _addresscontroller,
                  hint: "Your permanent address"),
              const SizedBox(height: 20.0),
              customTextField(
                  controllerName: _expcontroller,
                  hint: "Year(s) of experience"),
              const SizedBox(
                height: 20.0,
              ),
              customTextField(
                  controllerName: _universitycontroller,
                  hint: "Name of your university"),
              const SizedBox(
                height: 20.0,
              ),
              customTextField(
                  controllerName: _registerIdcontroller,
                  hint: "Govt. approved registered ID"),
              const SizedBox(
                height: 20.0,
              ),
              customTextField(
                  controllerName: _casenumbercontroller,
                  hint: "How many case have you handled"),
              const SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: green),
                  onPressed: () {
                    _phonecontroller.clear();
                    _addresscontroller.clear();
                    _expcontroller.clear();
                    _universitycontroller.clear();
                    _registerIdcontroller.clear();
                    _casenumbercontroller.clear();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProvidersHome(),
                    ));
                  },
                  child: customTextWidget(
                    "Continue",
                    16.0,
                    FontWeight.bold,
                    white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
