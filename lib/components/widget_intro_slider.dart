import 'package:MiniPonik/screens/screen_authentication/screen_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:MiniPonik/model/mode_view_content.dart';
// import 'package:kamus/model/mode_view_content.dart';
// import 'package:kamus/screens/screen_authentication/screen_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool open = true;

class IntroScreen extends StatefulWidget {
  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  openIntro(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'open';
    final value = token;
    prefs.setString(key, value);
  }

  @override
  void initState() {
    super.initState();

    // openIntro('');

    slides.add(
      new Slide(
        styleTitle: TextStyle(color: Colors.black),
        description:
            "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        styleDescription: TextStyle(color: Colors.white),
        backgroundImage: "assets/img/2.jpg",
        // centerWidget: Text('data')
      ),
    );
    slides.add(
      new Slide(
        description:
            "Ye indulgence unreserved connection alteration appearance",
        styleDescription: TextStyle(color: Colors.white),
        backgroundImage: "assets/img/3.png",
        // centerWidget: Text('data')
        // backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        styleDescription: TextStyle(color: Colors.white),
        backgroundImage: "assets/img/1.jpg",
        // centerWidget: Text('data')
      ),
    );
  }

  void onDonePress() {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeftWithFade,
        child: ScreenAuth(),
      ),
    );
    openIntro('buka');
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      colorDoneBtn: Color(0xff00d2ff),
      colorSkipBtn: Color(0xff3a7bd5),
      colorDot: Color(0xff3a7bd5),
      colorActiveDot: Color(0xff00d2ff),
    );
  }
}
