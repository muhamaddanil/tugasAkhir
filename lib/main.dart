import 'package:MiniPonik/screens/screen_authentication/screen_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:MiniPonik/components/widget_intro_slider.dart';
import 'package:MiniPonik/model/mode_view_content.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Main
String intro = '';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  var key = 'open';
  intro = prefs.get(key) ?? '';
  runApp(MaterialApp(
    home: intro == '' ? IntroScreen() : ViewContent(),
    debugShowCheckedModeBanner: false,
  ));
  debugPrint('$intro');

}

String tokenFirebase = '';
String messageText = "Waiting for message...";
final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    new FlutterLocalNotificationsPlugin();
bool progresIndicator = false;

@override
void initState() {
  main();
}
