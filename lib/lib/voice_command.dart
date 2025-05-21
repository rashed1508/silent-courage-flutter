import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceCommandPage extends StatefulWidget {
  @override
  _VoiceCommandPageState createState() => _VoiceCommandPageState();
}

class _VoiceCommandPageState extends State<VoiceCommandPage> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'ভয়েস কমান্ড শুনছি...';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) {
            setState(() {
              _text = val.recognizedWords;
              if (_text.toLowerCase().contains("sos") || _text.toLowerCase().contains("help")) {
                // এখানে SOS ফাংশন কল করবে
                print("SOS Triggered!");
              }
            });
          },
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ভয়েস কমান্ড')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_text),
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: _listen,
              child: Icon(_isListening ? Icons.mic : Icons.mic_none),
            ),
          ],
        ),
      ),
    );
  }
}
