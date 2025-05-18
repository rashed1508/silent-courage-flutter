import 'package:flutter/material.dart';
import 'trusted_contacts_page.dart';

void main() {
  runApp(SilentCourageApp());
}

class SilentCourageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Silent Courage',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: import 'package:flutter/material.dart';
import 'sos_page.dart';

void main() {
  runApp(MaterialApp(
    home: SOSPage(),
  ));
}

      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  void sendSilentAlert(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('🆘 নিরব SOS পাঠানো হয়েছে'),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('নিরব সাহস')),
      body: Center(
        child: ElevatedButton.icon(
          icon: Icon(Icons.emergency),
          label: Text('Silent SOS পাঠাও'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: TextStyle(fontSize: 18),
          ),
          onPressed: () => sendSilentAlert(context),
        ),
      ),
    );
  }
}
body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton.icon(
        icon: Icon(Icons.emergency),
        label: Text('Silent SOS পাঠাও'),
        onPressed: () {
          // এখানে পরে SOS function বসানো হবে
        },
      ),
      SizedBox(height: 16),
      ElevatedButton.icon(
        icon: Icon(Icons.contact_phone),
        label: Text('Trusted Contacts'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TrustedContactsPage()),
          );
        },
      ),
    ],
  ),
),
// Drawer বা Home থেকে SOSPage-এ যাওয়ার জন্য:
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SOSPage()),
);
