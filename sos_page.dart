import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SOSPage extends StatelessWidget {
  Future<void> _sendSOS() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString('trusted_contacts');
    if (data != null) {
      // For simplicity, sending SOS to the first contact
      final contacts = List<Map<String, dynamic>>.from(
        (data as List).map((e) => Map<String, dynamic>.from(e)),
      );

      final number = contacts.first['number'];
      final Uri smsUri = Uri(
        scheme: 'sms',
        path: number,
        queryParameters: {'body': 'আমি বিপদে আছি, দয়া করে সাহায্য করুন!'},
      );

      if (await canLaunchUrl(smsUri)) {
        await launchUrl(smsUri);
      } else {
        print("Could not launch SMS");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SOS')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: _sendSOS,
          icon: Icon(Icons.warning, color: Colors.white),
          label: Text('SOS পাঠান'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
g￼Entererride
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SOS')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: _sendSOS,
          icon: Icon(Icons.warning, color: Colors.white),
          label: Text('SOS পাঠান'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
￼Enter
