import 'package:flutter/material.dart';

class ForgotPassword extends ModalRoute<void> {
  final String word;
  final String ejaan1;
  final String ejaan2;

  ForgotPassword({
    this.word,
    this.ejaan1,
    this.ejaan2,
  });

  @override
  Duration get transitionDuration => Duration(milliseconds: 200);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,

      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    child: Icon(Icons.bookmark, size: 50.0),
                  ),
                  SizedBox(height: 25.0),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Masukkan Email Anda.",
                      ),
                      style: TextStyle(
                        fontFamily: "NeoSans",
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Lorem Ipsum sir Doloe Amer TUdo Duo Dui"),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: MaterialButton(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: StadiumBorder(),
                      color: Colors.lightBlue,
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

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
