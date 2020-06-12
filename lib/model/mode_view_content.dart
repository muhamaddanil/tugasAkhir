import 'package:MiniPonik/main.dart';
import 'package:MiniPonik/notifikasi/messaging.dart';
import 'package:MiniPonik/screens/screen_archive/screen_test.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MiniPonik/components/widget_bottom_navy_bar.dart';
import 'package:MiniPonik/screens/screen_archive/screen_archive.dart';
import 'package:MiniPonik/screens/screen_home/screen_home.dart';
import 'package:MiniPonik/screens/screen_profile/screen_profile.dart';
import 'package:MiniPonik/theme/appTheme.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:quiver/async.dart';

class ViewContent extends StatefulWidget {
  final Widget aa;
  // final Widget a2;

  const ViewContent({Key key, this.aa}) : super(key: key);
  @override
  _ViewContentState createState() => _ViewContentState(aa);
}

final List<Widget> screenOptions = [
  ScreenHome(),
  ScreenArchive(),
  ScreenProfile(),
];

class _ViewContentState extends State<ViewContent> {
  final Widget ab;
  // final Widget abc;
  int currentIndex = 0;

  _ViewContentState(this.ab);

  // void onViewsTapped(int index) {
  //   setState(() {
  //     currentIndex = index;
  //   });
  // }
  void sendTokenToServer(String fcmToken) {
    print('Token: $fcmToken');
    // send key to your server to allow server to use
    // this token to send push notifications
  }

  

  firebaseNotifikasi() async {
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidRecieveLocalNotification);

    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    firebaseMessaging.onTokenRefresh.listen(sendTokenToServer);
    // firebaseMessaging.getToken();

    firebaseMessaging.subscribeToTopic('F0_48_13_A3');
    

    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        setState(() {
          messageText = "Push Messaging message: $message";
        });
        print('on message ${message}');
        await displayNotification(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
        setState(() {
          messageText = "Push Messaging message: $message";
        });
        await displayNotification(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        // counter--;
        print('on launch $message');
        setState(() {
          messageText = "Push Messaging message: $message";
        });
        await displayNotification(message);
      },
    );

    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      print(token);
      tokenFirebase = token;
    });
  }

  Future displayNotification(Map<String, dynamic> message) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      message['notification']['title'],
      '${message['notification']['body']}\n ${message['data']['skpd_nama']},',
      platformChannelSpecifics,
      payload:
          '${message['data']['telaah_id']},${message['data']['telaah_kategori']}',
    );
    print(message);
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: 0000' + payload);
    }
    await Fluttertoast.showToast(
        msg: "Notification Clicked dalam aplikasi",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future onDidRecieveLocalNotification(
      int id, String title, String body, String payload) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text(title),
        content: new Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Fluttertoast.showToast(
                  msg: "Notification Clicked dari atas",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 16.0);
              debugPrint('notification payload: 1234' + payload);
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    firebaseNotifikasi();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: Scaffold(
        bottomNavigationBar: BottomNavyBarX(
          selectedIndex: currentIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            currentIndex = index;
          }),
          items: [
            BottomNavyBarItemX(
              icon: Icon(Icons.home),
              title: Text('Monitoring'),
              activeColor: Color(0xff00d2ff),
              inactiveColor: Color(0xff3a7bd5),
              archivee: true,
            ),
            BottomNavyBarItemX(
                icon: Icon(Icons.bookmark),
                title: Text('Archive'),
                activeColor: Color(0xff00d2ff),
                inactiveColor: Color(0xff3a7bd5),
                archivee: false),
            BottomNavyBarItemX(
              icon: Icon(Icons.info),
              title: Text('About'),
              activeColor: Color(0xff00d2ff),
              inactiveColor: Color(0xff3a7bd5),
              archivee: true,
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            // Box decoration takes a gradient
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Color(0xff3a7bd5),
                Color(0xff00d2ff),
              ],
            ),
          ),
          child: screenOptions[currentIndex],
        ),
      ),
    );
  }
}
