import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';

class Messaging {
  static final Client client = Client();

  // from 'https://console.firebase.google.com'
  // --> project settings --> cloud messaging --> "Server key"
  static const String serverKey =
      'AAAAaqiM5T4:APA91bFvDww2ExfsHatp32dlQiNWSHk0dQpn30asLOFXN_96aLnvTmLc1JWtKAF9Nqa3jBm0I5XktA7BEkevyKKEYgaVZDmBTyS7ObEAfSwrjPC_yKenBskFta8W5GdlAO7kJSJT5dcc';

  // static Future<Response> sendToAll({
  //   @required String title,
  //   @required String body,
  // }) =>
  //     sendToTopic(title: title, body: body, topic: 'all');
  
  static Future<Response> sendToTopic(
          {@required String title,
          @required String body,
          @required String telaahKategori,
          @required String tgl,
          @required String skpdNama,
    @required String telaahId,
          @required String topic}) =>
      sendTo(title: title, body: body,tgl:tgl,telaahId: telaahId, skpdNama: skpdNama,telaahKategori: telaahKategori, fcmToken: '/topics/$topic');

  static Future<Response> sendTo({
    @required String title,
    @required String body,
    @required String telaahKategori,
    @required String telaahId,
    @required String tgl,
    @required String skpdNama,
    @required String fcmToken,
  }) =>
      client.post(
        'https://fcm.googleapis.com/fcm/send',
        body: json.encode({
          'notification': {'body': '$body', 'title': '$title'},
          'priority': 'high',
          'data': {
            'tanggal': '$tgl',
            'telaah_id': '$telaahId',
            'tujuan': 'done',
            'telaah_kategori': '$telaahKategori',
            'skpd_nama': '$skpdNama',
          },
          // 'to': '681',
          'to': '$fcmToken',
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverKey',
        },
      );
}
