import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextDialog extends StatefulWidget {
  const SpeechToTextDialog({super.key});

  @override
  State<SpeechToTextDialog> createState() => _SpeechToTextDialogState();
}

class _SpeechToTextDialogState extends State<SpeechToTextDialog> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  _stopListening();
                  Navigator.pop(context, _lastWords);
                },
              ),
            ),
            IconButton(
              onPressed:
                  _speechToText.isNotListening
                      ? _startListening
                      : _stopListening,
              icon: Icon(
                _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
                size: 25,
              ),
            ),
            Text(
              _speechToText.isListening
                  ? 'Listening'
                  : _speechEnabled
                  ? 'Tap to Speak'
                  : 'Speech not available',
            ),

            Text('Listened Words : $_lastWords', maxLines: 4),
          ],
        ),
      ),
    );
  }
}
