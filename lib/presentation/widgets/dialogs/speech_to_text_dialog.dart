import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
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
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {
      _isListening = true;
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {
      _isListening = false;
    });
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

            AvatarGlow(
              animate: _speechToText.isListening,
              glowColor: kRedColor,
              duration: Duration(milliseconds: 2000),

              repeat: true,

              child: Material(
                elevation: 4.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  child: IconButton(
                    onPressed: !_isListening ? _startListening : _stopListening,
                    icon: Icon(
                      _isListening ? Icons.mic : Icons.mic_off,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              _speechToText.isListening
                  ? 'Listening'
                  : _speechEnabled || !_isListening
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
