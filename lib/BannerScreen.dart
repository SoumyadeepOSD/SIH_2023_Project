import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';


class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {



  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*.25,
        color: Colors.cyan,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text('Legal इनोवेटर्स',
                          style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                          height: 45.0,
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                            child: AnimatedTextKit(
                              repeatForever: true,
                              isRepeatingAnimation: true,
                              animatedTexts: [
                                FadeAnimatedText('Reach 10 Lakh+\nIntrested Users!'),
                                FadeAnimatedText('New way of\nWaste Management!!'),
                                FadeAnimatedText('Over 1 Lakh+\n Users!!!'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Neumorphic(
                      style: NeumorphicStyle(
                        color: Colors.white,
                        oppositeShadowLightSource: true,
                      ),
                      child: Image.network
                        ('https://firebasestorage.googleapis.com/v0/b/apna-kavach.appspot.com/o/Legal.png?alt=media&token=02b46fb8-79d0-43da-8332-958a836df8d3'),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: NeumorphicButton(
                    onPressed: (){},
                    style: NeumorphicStyle(color: Colors.yellow),
                    child: Text('SPEAK',textAlign: TextAlign.center,),
                  ),),

                  SizedBox(width: 20,),
                  Expanded(child: NeumorphicButton(
                    onPressed: (){},
                    style: NeumorphicStyle(color: Colors.yellow),
                    child: Text('LISTEN',textAlign: TextAlign.center),
                  ),),

                ],
              )
            ],
          ),
        ),),
    );
  }
}
