import 'package:flutter/material.dart';
import 'package:MiniPonik/model/mode_view_content.dart';
import 'package:MiniPonik/screens/screen_authentication/widgets/widget_forgot_password_view.dart';
import 'package:page_transition/page_transition.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  void _showOverlay(BuildContext context) {
    Navigator.of(context).push(
      ForgotPassword(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(4.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(8.0, 22.0, 8.0, 22.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Username",
                          style: TextStyle(
                            fontFamily: "NeoSans",
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Password",
                          style: TextStyle(
                            fontFamily: "NeoSans",
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(12.0),
                    child: MaterialButton(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: StadiumBorder(),
                      color: Colors.lightBlue,
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: ViewContent()));
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(12.0),
                    child: InkWell(
                      child: Text(
                        "Lupa Password.",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        _showOverlay(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
