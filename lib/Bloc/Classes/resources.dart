import 'package:flutter/services.dart';

class Resources {
  static const String apiKey = '98a3681fb714bcff7aa402873d3642d6';
  static const weatherPng = {
    '01d': 'assets/images/01d.png',
    '01n': 'assets/images/01n.png',
    '02d': 'assets/images/02d.png',
    '02n': 'assets/images/02n.png',
    '03d': 'assets/images/03d.png',
    '03n': 'assets/images/03n.png',
    '04d': 'assets/images/04d.png',
    '04n': 'assets/images/04n.png',
    '09d': 'assets/images/09d.png',
    '09n': 'assets/images/09n.png',
    '10d': 'assets/images/10d.png',
    '10n': 'assets/images/10n.png',
    '11d': 'assets/images/11d.png',
    '11n': 'assets/images/11n.png',
    '13d': 'assets/images/13d.png',
    '13n': 'assets/images/13n.png',
    '50d': 'assets/images/50d.png',
    '50n': 'assets/images/50n.png',
  };
  static Future<void> shareData(String data) async {
    const platform = const MethodChannel('weather/share');
    try {
      await platform.invokeMethod('shareData', data);
    } on PlatformException catch (e) {
      print('Ошибка платформы: ${e.message}');
    } catch (e) {
      print(e);
    }
  }
}
