import 'package:MiniPonik/notifikasi/messaging.dart';
import 'package:MiniPonik/screens/screen_archive/screen_test.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiver/async.dart';

var id;

class ScreenHome extends StatefulWidget {
  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  void start() async {
    int _start = 10;
    int _current = 10;
    String idUser =
        (await FirebaseDatabase.instance.reference().child("user_id").once())
            .value;
    bool sensorUltrasonik = (await FirebaseDatabase.instance
            .reference()
            .child("sensor_ultrasonik")
            .once())
        .value;
    bool sensorPir =
        (await FirebaseDatabase.instance.reference().child("sensor_pir").once())
            .value;
    print('ini id user = $idUser $sensorPir $sensorUltrasonik');
    if ('F0_48_13_A3' == idUser &&
        sensorUltrasonik == true &&
        sensorPir == true) {
      await sendNotification(idUser);
      CountdownTimer countDownTimer = new CountdownTimer(
        new Duration(seconds: _start),
        new Duration(seconds: 1),
      );

      var sub = countDownTimer.listen(null);
      sub.onData((duration) {
        setState(() {
          _current = _start - duration.elapsed.inSeconds;
        });
      });
      print('counter$countDownTimer');
      print('_current$_current');

      sub.onDone(() async {
        print("Done");
        await FirebaseDatabase.instance.reference().child("user_id").set('');
        await FirebaseDatabase.instance.reference().child("sensor_ultrasonik").set(false);
        await FirebaseDatabase.instance.reference().child("sensor_pir").set(false);
        sub.cancel();
      });
    }
  }

  Future sendNotification(String userId) async {
    String dateNow = DateFormat('dd-MM-yyyy').format(DateTime.now());
    final response = await Messaging.sendToTopic(
        skpdNama: '',
        tgl: dateNow,
        title: 'Info Terapi',
        body: 'Muhammad Iqbal Tahir',
        telaahId: '',
        telaahKategori: '',
        topic: userId);
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              content: Container(
                height: 127.0,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Center(child: Text('Info Terapi')),
                    Center(child: Text('Anak Mulai Terapi')),
                    SizedBox(height: 20.0),
                    Divider(
                      color: Colors.black,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 140,
                          child: MaterialButton(
                            color: Colors.white,
                            child: new Text("Nonton"),
                            onPressed: () async {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      BumbleBeeRemoteVideo()));
                            },
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        Container(
                          width: 140,
                          child: MaterialButton(
                            color: Colors.white,
                            child: new Text("Simpan"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          });
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content:
            Text('[${response.statusCode}] Error message: ${response.body}'),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              // ------------------------- SLIVER HEADER -------------------------//

              SliverAppBar(
                elevation: 0.0,
                expandedHeight: 175.0,
                floating: false,
                pinned: false,
                snap: false,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(32.0),
                          child: Text(
                            "Nama Aplikasi",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "NotoSerif",
                            ),
                          ),
                        ),
                        Container(
                          width: 250.0,
                          child: Text(
                            '"Data Anak Anda"',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },

          // ------------------------- SLIVER HEADER END -------------------------//

          // ------------------------- BODY -------------------------//
          body: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 100.0),
                  MaterialButton(
                    color: Colors.white,
                    child: new Text("Refresh"),
                    onPressed: () {
                      start();
                    },
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 50.0),
                  //   child: Row(
                  //     children: <Widget>[
                  //       Image.asset(
                  //         'assets/img/cold.png',
                  //         scale: 5,
                  //       ),
                  //       SizedBox(width: 90.0),
                  //       Column(
                  //         children: <Widget>[
                  //           Row(
                  //             children: <Widget>[
                  //               Stack(
                  //                 children: <Widget>[
                  //                   Text(
                  //                     '29',
                  //                     style: TextStyle(
                  //                         color: Colors.white, fontSize: 35),
                  //                   ),
                  //                   Padding(
                  //                     padding:
                  //                         const EdgeInsets.only(left: 44.0),
                  //                     child: Text(
                  //                       'o',
                  //                       style: TextStyle(
                  //                           color: Colors.white, fontSize: 17),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //               Text(
                  //                 'C',
                  //                 style: TextStyle(
                  //                     color: Colors.white, fontSize: 35),
                  //               ),
                  //             ],
                  //           ),
                  //           Text(
                  //             'BAD',
                  //             style:
                  //                 TextStyle(color: Colors.white54, fontSize: 10),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: 100.0),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 50.0),
                  //   child: Row(
                  //     children: <Widget>[
                  //       Image.asset(
                  //         'assets/img/humidity.png',
                  //         scale: 5,
                  //       ),
                  //       SizedBox(width: 90.0),
                  //       Column(
                  //         children: <Widget>[
                  //           Row(
                  //             children: <Widget>[
                  //               Stack(
                  //                 children: <Widget>[
                  //                   Text(
                  //                     '81',
                  //                     style: TextStyle(
                  //                         color: Colors.white, fontSize: 35),
                  //                   ),
                  //                   Padding(
                  //                     padding:
                  //                         const EdgeInsets.only(left: 44.0),
                  //                     child: Text(
                  //                       'o',
                  //                       style: TextStyle(
                  //                           color: Colors.white, fontSize: 17),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //               Text(
                  //                 'F',
                  //                 style: TextStyle(
                  //                     color: Colors.white, fontSize: 35),
                  //               ),
                  //             ],
                  //           ),
                  //           Text(
                  //             'BAD',
                  //             style:
                  //                 TextStyle(color: Colors.white54, fontSize: 10),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          )

          // ------------------------- BODY END -------------------------//
          ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final Widget _tabBar;

  @override
  double get minExtent => 150.0;
  @override
  double get maxExtent => 150.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return true;
  }
}
