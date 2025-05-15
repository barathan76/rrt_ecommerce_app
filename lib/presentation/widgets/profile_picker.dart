import 'package:flutter/material.dart';

class ProfilePicker extends StatefulWidget {
  const ProfilePicker({super.key, this.imagePath, required this.onPressed});
  final String? imagePath;
  final void Function() onPressed;
  @override
  State<ProfilePicker> createState() => _ProfilePickerState();
}

class _ProfilePickerState extends State<ProfilePicker> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Circular user image with border
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 0),
            image: DecorationImage(
              image: AssetImage('assets/profile.png'),
              // image: widget.imagePath == null ? AssetImage('assets/profile.png') : (
              //   FileImage(widget.imagePath),
              // Replace with your image
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Positioned icon at bottom right
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: () {
              widget.onPressed();
            },
            customBorder: CircleBorder(),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Icon(Icons.edit, color: Colors.white, size: 16),
            ),
          ),
        ),
      ],
    );
  }
}
