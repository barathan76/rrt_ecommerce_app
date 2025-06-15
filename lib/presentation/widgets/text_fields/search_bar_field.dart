import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/dialogs/speech_to_text_dialog.dart';

class SearchBarField extends StatelessWidget {
  const SearchBarField({super.key, this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: ' Search any Product...',
        hintStyle: mtextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Color.fromARGB(255, 187, 187, 187),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Icon(Icons.search, color: Color.fromARGB(255, 187, 187, 187)),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: IconButton(
            onPressed: () async {
              final data = await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (ctx) => SpeechToTextDialog(),
              );
              if (data.isNotEmpty) {
                controller!.text = controller!.text + data;
              }
            },
            icon: Icon(
              Icons.mic_none,
              color: Color.fromARGB(255, 187, 187, 187),
            ),
          ),
        ),
      ),
    );
  }
}
