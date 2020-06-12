import 'package:MiniPonik/screens/screen_authentication/screen_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:MiniPonik/components/widget_intro_slider.dart';
import 'package:MiniPonik/screens/screen_profile/widgets/widget_expansion_tile.dart';

class EditSettingView extends StatefulWidget {
  @override
  _EditSettingViewState createState() => _EditSettingViewState();
}

class _EditSettingViewState extends State<EditSettingView> {
  bool downloadCiaCia = false;
  bool downloadTolaki = false;
  bool downloadMuna = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // ------------------------- ABOUT CARD -------------------------//

          Card(
            margin: EdgeInsets.all(4.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(4.0),
              child: ExpansionTileX(
                headerBackgroundColor: Colors.transparent,
                title: Text(
                  "Tentang",
                  style: TextStyle(
                    fontFamily: "NeoSans",
                  ),
                ),
                children: <Widget>[
                  Image.asset(
                    'assets/images/loginicon.jpeg',
                    scale: 4,
                  ),
                  Text("Portal Studio", style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Contact info",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Btn. Perdos blok x nomor 13  Kota Kendari",
                      style: TextStyle(fontSize: 12)),
                  Text("portalstudio33@gmail.com",
                      style: TextStyle(fontSize: 12)),
                  Text("0853-9869-8896", style: TextStyle(fontSize: 12)),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.all(32.0),
                    child: Text(
                      "Copyright © 2019 by Portal Studio All rights reserved. No part of this publication may be reproduced, distributed, or transmitted in any form or by any means, including photocopying, recording, or other electronic or mechanical methods, without the prior written permission of the publisher, except in the case of brief quotations embodied in critical reviews and certain other noncommercial uses permitted by copyright law. For permission requests, write to the publisher, addressed “Attention: Permissions Coordinator,” at the address above.",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ------------------------- ABOUT CARD END -------------------------//

          // ------------------------- CONTRIBUTE CARD -------------------------//

          Card(
            margin: EdgeInsets.all(4.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
            ),
            child: RawMaterialButton(
              child: Container(
                padding: EdgeInsets.all(4.0),
                child: ListTile(
                  title: Text(
                    "Intro",
                    style: TextStyle(
                      fontFamily: "NeoSans",
                    ),
                  ),
                  trailing: Icon(Icons.launch),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => IntroScreen()));
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(4.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
            ),
            child: RawMaterialButton(
              child: Container(
                padding: EdgeInsets.all(4.0),
                child: ListTile(
                  title: Text(
                    "Logout",
                    style: TextStyle(
                      fontFamily: "NeoSans",
                    ),
                  ),
                  trailing: Icon(Icons.launch),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ScreenAuth()));
              },
            ),
          ),

          // ------------------------- CONTRIBUTE CARD END -------------------------//

          // ------------------------- CONTRIBUTE CARD -------------------------//

         
        ],
      ),
    );
  }
}
