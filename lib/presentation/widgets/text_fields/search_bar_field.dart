import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/dialogs/speech_to_text_dialog.dart';

class SearchBarField extends StatefulWidget {
  const SearchBarField({super.key});

  @override
  State<SearchBarField> createState() => _SearchBarFieldState();
}

class _SearchBarFieldState extends State<SearchBarField> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: ' Search any Product...',
        hintStyle: GoogleFonts.montserrat(
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
                builder: (ctx) => SpeechToTextDialog(),
              );
              if (data.isNotEmpty) {
                controller.text = controller.text + data;
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
