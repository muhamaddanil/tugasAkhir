import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // ------------------------- USERNAME & PROFILE PICTURE CARD -------------------------//

          Card(
            margin: EdgeInsets.all(4.0),
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
                    padding: EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 4.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Username & Profile Picture",
                          style: TextStyle(
                            fontFamily: "NeoSans",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Usernamenya",
                      ),
                      style: TextStyle(
                        fontFamily: "NeoSans",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          child: Text(
                            "Upload Gambar",
                            style: TextStyle(
                              color: Color(0xff7CA2EC),
                            ),
                          ),
                          onPressed: () {},
                        ),
                        MaterialButton(
                          shape: StadiumBorder(),
                          color: Colors.blue,
                          child: Text(
                            "Simpan",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ------------------------- USERNAME & PROFILE PICTURE CARD END-------------------------//

          // ------------------------- CHANGE PASSWORD CARD -------------------------//

          Card(
            margin: EdgeInsets.all(4.0),
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
                    padding: EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 4.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Ganti Password",
                          style: TextStyle(
                            fontFamily: "NeoSans",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Password Lama",
                          ),
                          style: TextStyle(
                            fontFamily: "NeoSans",
                          ),
                        ),
                        SizedBox(height: 12.0),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Password Baru",
                          ),
                          style: TextStyle(
                            fontFamily: "NeoSans",
                          ),
                        ),
                        SizedBox(height: 12.0),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Konfirmasi Password Baru",
                          ),
                          style: TextStyle(
                            fontFamily: "NeoSans",
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Container(
                          alignment: Alignment.centerRight,
                          child: MaterialButton(
                            shape: StadiumBorder(),
                            color: Colors.blue,
                            child: Text(
                              "Simpan",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ------------------------- CHANGE PASSWORD CARD END -------------------------//
        ],
      ),
    );
  }
}
