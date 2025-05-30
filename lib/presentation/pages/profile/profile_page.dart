import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/appbars/app_bar_cs.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/bottombars/custom_bottom_navigation_bar.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/submit_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/elements/profile_picker.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/text_fields/input_text_field.dart';
import 'package:rrt_ecommerce_app/services/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  File? image;

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    emailController.text = 'sample@email.com';
    super.initState();
  }

  void onSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCS(
        title: 'Profile Details',
        style: mtextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
      // appBar: AppBar(
      //   title: Text(
      //     'Profile Details',
      //     style: mtextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      //   ),
      // ),
      bottomNavigationBar: CustomBottomNavigationBar(index: 4),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 350,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  ProfilePicker(
                    image: image,
                    onPressed: () async {
                      XFile? pickedImage = await imagePicker();
                      if (pickedImage != null) {
                        setState(() {
                          image = File(pickedImage.path);
                        });
                      }
                    },
                  ),

                  TitleText(text: 'Personal Details'),

                  // IgnorePointer(
                  //   child: InputTextField(
                  //     obscure: true,
                  //     title: 'Password',
                  //     controller: passwordController,

                  //     hint: 'type password',
                  //   ),
                  // ),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: UOTextButton(
                  //     text: 'Change Password',
                  //     fontSize: 12,
                  //     onPressed: () {},
                  //   ),
                  // ),
                  InputTextField(
                    obscure: false,
                    title: 'First Name',
                    controller: firstNameController,
                    hint: 'type first name',
                  ),
                  InputTextField(
                    obscure: false,
                    title: 'Last Name',
                    controller: lastNameController,
                    hint: 'type last name',
                  ),
                  divide(),
                  InputTextField(
                    obscure: false,
                    title: 'Mobile Number',
                    regExp: numberRegex,
                    controller: phoneNumberController,

                    hint: 'type mobile number',
                  ),
                  IgnorePointer(
                    child: InputTextField(
                      obscure: false,
                      title: 'Email Address',
                      controller: emailController,
                      hint: 'type email',
                    ),
                  ),

                  divide(),
                  SubmitButton(
                    onPressed: () {
                      onSubmit(context);
                    },
                    text: 'Submit',
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
