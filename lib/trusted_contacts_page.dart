import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TrustedContactsPage extends StatefulWidget {
  @override
  _TrustedContactsPageState createState() => _TrustedContactsPageState();
}

class _TrustedContactsPageState extends State<TrustedContactsPage> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  List<Map<String, String>> contacts = [];

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  Future<void> loadContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString('trusted_contacts');
    if (data != null) {
      final List decoded = jsonDecode(data);
      setState(() {
        contacts = List<Map<String, String>>.from(decoded);
      });
    }
  }

  Future<void> saveContacts() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('trusted_contacts', jsonEncode(contacts));
  }

  void addContact() {
    if (nameController.text.isEmpty || numberController.text.isEmpty) return;
    setState(() {
      contacts.add({
        'name': nameController.text,
        'number': numberController.text,
      });
      nameController.clear();
      numberController.clear();
      saveContacts();
    });
  }

  void deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
      saveContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('বিশ্বাসযোগ্য যোগাযোগ')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'নাম'),
            ),
            TextField(
              controller: numberController,
              decoration: InputDecoration(labelText: 'ফোন নাম্বার'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: addContact,
              child: Text('যোগ করুন'),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return ListTile(
                    title: Text(contact['name']!),
                    subtitle: Text(contact['number']!),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => deleteContact(index),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
