import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
                          "E-mail",
                          style: TextStyle(
                            fontFamily: "NeoSans",
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(),
                          style: TextStyle(
                            fontFamily: "NeoSans",
                          ),
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
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Confirm Password",
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
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: StadiumBorder(),
                      color: Colors.lightGreen,
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {},
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
