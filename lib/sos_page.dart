import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

class SOSPage extends StatefulWidget {
  @override
  _SOSPageState createState() => _SOSPageState();
}

class _SOSPageState extends State<SOSPage> {
  Future<void> _sendSOS() async {
    // পারমিশন চেক
    await Permission.location.request();

    // লোকেশন সংগ্রহ
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    String message =
        "আমি বিপদে আছি! আমার লোকেশন: https://maps.google.com/?q=${position.latitude},${position.longitude}";

    // ট্রাস্টেড কন্টাক্ট লিস্ট (ডেমো হিসেবে)
    List<String> contacts = ["+8801234567890", "+8801987654321"];

    for (String number in contacts) {
      final Uri smsUri = Uri.parse('sms:$number?body=${Uri.encodeComponent(message)}');
      if (await canLaunchUrl(smsUri)) {
        await launchUrl(smsUri);
      } else {
        print("Could not launch SMS to $number");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SOS')),
      body: Center(
        child: ElevatedButton.icon(
          icon: Icon(Icons.warning, color: Colors.white),
          label: Text("SOS পাঠাও"),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: _sendSOS,
        ),
      ),
    );
  }
}
￼Enter
