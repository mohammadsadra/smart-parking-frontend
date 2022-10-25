// import 'dart:io';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_parking/Controllers/home_controller.dart';
import 'package:smart_parking/Controllers/parking_controller.dart';
import 'package:smart_parking/Screens/get_row_column.dart';
import 'package:smart_parking/Screens/home_page.dart';
import 'package:get/get.dart';
import 'package:smart_parking/Screens/parking_map.dart';
import 'package:smart_parking/Widgets/custom_material_color.dart' as clr;
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

void main() async {
  await GetStorage.init();
  MQTTClientWrapper newclient = new MQTTClientWrapper();
  newclient.prepareMqttClient();
  runApp(const MyApp());
  Get.put(HomeController()).initLocationService();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'i-Park',
      theme: ThemeData(
        primarySwatch: clr.CustomMaterialColor(133, 214, 224).mdColor,
        secondaryHeaderColor: const Color.fromRGBO(32, 66, 243, 1),
        fontFamily: 'Kalameh',
        scaffoldBackgroundColor: const Color.fromRGBO(243, 246, 250, 1),
      ),
      locale: const Locale('fa', 'IR'),
      debugShowCheckedModeBanner: false,
      home: GetRowColumn(),
      // home: const HomePage(),
    );
  }
}

enum MqttCurrentConnectionState {
  IDLE,
  CONNECTING,
  CONNECTED,
  DISCONNECTED,
  ERROR_WHEN_CONNECTING
}

enum MqttSubscriptionState { IDLE, SUBSCRIBED }

class MQTTClientWrapper {
  MqttServerClient? client;

  MqttCurrentConnectionState connectionState = MqttCurrentConnectionState.IDLE;
  MqttSubscriptionState subscriptionState = MqttSubscriptionState.IDLE;

  // using async tasks, so the connection won't hinder the code flow
  void prepareMqttClient() async {
    _setupMqttClient();
    await _connectClient();
    _subscribeToTopic('ipark/getMessage');
    // _publishMessage('Hello');
  }

  // waiting for the connection, if an error occurs, print it and disconnect
  Future<void> _connectClient() async {
    try {
      print('client connecting....');
      connectionState = MqttCurrentConnectionState.CONNECTING;
      await client!.connect('ipark', 'Roghaye99');
    } on Exception catch (e) {
      print('client exception - $e');
      connectionState = MqttCurrentConnectionState.ERROR_WHEN_CONNECTING;
      client!.disconnect();
    }

    // when connected, print a confirmation, else print an error
    if (client!.connectionStatus!.state == MqttConnectionState.connected) {
      connectionState = MqttCurrentConnectionState.CONNECTED;
      print('client connected');
    } else {
      print(
          'ERROR client connection failed - disconnecting, status is ${client!.connectionStatus}');
      connectionState = MqttCurrentConnectionState.ERROR_WHEN_CONNECTING;
      client!.disconnect();
    }
  }

  void _setupMqttClient() {
    client = MqttServerClient.withPort(
        '8f8cd509697c4a1082e038331baa9680.s2.eu.hivemq.cloud',
        'ipark-flutter',
        8883);
    // the next 2 lines are necessary to connect with tls, which is used by HiveMQ Cloud
    client!.secure = true;
    client!.securityContext = SecurityContext.defaultContext;
    client!.keepAlivePeriod = 20;
    client!.onDisconnected = _onDisconnected;
    client!.onConnected = _onConnected;
    client!.onSubscribed = _onSubscribed;
  }

  void _subscribeToTopic(String topicName) {
    print('Subscribing to the $topicName topic');
    client!.subscribe(topicName, MqttQos.atMostOnce);

    // print the message when it is received
    client!.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
      var message =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      print('YOU GOT A NEW MESSAGE:');
      print(message);
      var ctrl = Get.put(ParkingController());
      if (ctrl.allParking != null) {
        ctrl.allParking.forEach((parking) {
          if (parking.guid == '5e162e60-ce47-42d1-bfe3-96859f8c0897') {
            parking.freeCapacity = int.parse(message);
          }
        });
      }
      ctrl.update();
    });
  }

  void _publishMessage(String message) {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(message);

    print(
        'Publishing message "$message" to topic ${'Dart/Mqtt_client/testtopic'}');
    client!
        .publishMessage('ipark/park1', MqttQos.exactlyOnce, builder.payload!);
  }

  // callbacks for different events
  void _onSubscribed(String topic) {
    print('Subscription confirmed for topic $topic');
    subscriptionState = MqttSubscriptionState.SUBSCRIBED;
  }

  void _onDisconnected() {
    print('OnDisconnected client callback - Client disconnection');
    connectionState = MqttCurrentConnectionState.DISCONNECTED;
  }

  void _onConnected() {
    connectionState = MqttCurrentConnectionState.CONNECTED;
    print('OnConnected client callback - Client connection was sucessful');
  }
}
