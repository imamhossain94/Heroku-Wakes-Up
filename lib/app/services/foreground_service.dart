import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../model/events.dart';
import 'hive_helper.dart';


@pragma('vm:entry-point')
void startCallback() {
  // The setTaskHandler function must be called to handle the task in the background.
  FlutterForegroundTask.setTaskHandler(MyTaskHandler());
}

class MyTaskHandler extends TaskHandler {
  SendPort? _sendPort;
  int _eventCount = 0;

  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    _sendPort = sendPort;

    // You can use the getData function to get the stored data.
    final customData =
        await FlutterForegroundTask.getData<String>(key: 'customData');
    print('customData: $customData');

    saveEvent(Events(
      id: const Uuid().v1().toString(),
      appId: '',
      appName: 'Foreground Service',
      timestamp: DateTime.now().toString(),
      status: 'success',
      summary: 'Foreground Service started successfully',
    ));

  }

  @override
  Future<void> onEvent(DateTime timestamp, SendPort? sendPort) async {
    FlutterForegroundTask.updateService(
      notificationTitle: 'Heroku Wake up',
      notificationText: 'Smartly give your free Heroku app a cup of coffee so it never sleeps and saves the dyno hour',
    );

    var appList = getAppList();
    for (var app in appList) {
      bool flag = false;
      DateTime now = DateTime.now();
      for (var wake in app.wakingUpTimes) {
        DateTime wakeUpTime = DateFormat("dd.MM.yyyy h:mm a")
            .parse('${now.day}.${now.month}.${now.year} $wake');

        DateTime startDate = now.subtract(const Duration(minutes: 5));
        DateTime endDate = now.add(const Duration(minutes: 5));
        if (startDate.isBefore(wakeUpTime) && endDate.isAfter(wakeUpTime)) {
          flag = true;
          break;
        }
      }
      if (flag) {
        // Give heroku a cup of coffee 🥀
        try {
          var response = await Dio().get(app.link);
          print(response);
          saveEvent(Events(
            id: const Uuid().v1().toString(),
            appId: app.id,
            appName: app.name,
            timestamp: DateTime.now().toString(),
            status: 'success',
            summary: '$response',
          ));
        } catch (e) {
          print(e);
          saveEvent(Events(
            id: const Uuid().v1().toString(),
            appId: app.id,
            appName: app.name,
            timestamp: DateTime.now().toString(),
            status: 'failure',
            summary: '$e',
          ));
        }
      }
    }
    sendPort?.send(_eventCount);
    _eventCount++;
  }

  @override
  Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) async {
    // You can use the clearAllData function to clear all the stored data.
    await FlutterForegroundTask.clearAllData();
    saveEvent(Events(
      id: const Uuid().v1().toString(),
      appId: '',
      appName: 'Foreground Service',
      timestamp: DateTime.now().toString(),
      status: 'error',
      summary: 'Foreground Service terminated',
    ));

  }

  @override
  void onButtonPressed(String id) {
    print('onButtonPressed >> $id');
  }

  @override
  void onNotificationPressed() {
    // FlutterForegroundTask.launchApp("/resume-route");
    _sendPort?.send('onNotificationPressed');
  }
}


