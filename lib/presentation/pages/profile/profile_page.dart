import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rrt_ecommerce_app/bloc/user_profile_bloc/user_profile_bloc.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/appbars/app_bar_cs.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/bottombars/custom_bottom_navigation_bar.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/submit_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/elements/profile_picker.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/text_fields/input_text_field.dart';
import 'package:rrt_ecommerce_app/services/image_picker.dart';
import 'package:rrt_ecommerce_app/services/validators.dart';
import 'package:user_repository/user_repository.dart';

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
  Uint8List? image;

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<UserProfileBloc>(context).add(LoadUserProfileEvent());
    });
    super.initState();
  }

  void onSubmit() async {
    String? profileImage = await convertImage(image);
    if (_formKey.currentState!.validate() && mounted) {
      BlocProvider.of<UserProfileBloc>(context).add(
        UpdateUserProfileEvent(
          userProfile: UserProfile(
            email: emailController.text,
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            mobileNumber: phoneNumberController.text,
            profileImage: profileImage,
          ),
        ),
      );
      Navigator.of(context).pop();
    }
  }

  void getImage(String profileImage) {
    setState(() {
      image = decodeImage(profileImage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserProfileBloc, UserProfileState>(
      listener: (context, state) {
        if (state is UserProfileSuccess) {
          lastNameController.text = state.userProfile.lastName ?? '';
          firstNameController.text = state.userProfile.firstName ?? '';
          emailController.text = state.userProfile.email;
          phoneNumberController.text = state.userProfile.mobileNumber ?? '';
          if (state.userProfile.profileImage != null) {
            getImage(state.userProfile.profileImage!);
          }
        } else if (state is UserProfileFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        appBar: AppBarCS(
          title: 'Profile Details',
          style: mtextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
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
                          Uint8List imagebytes =
                              await pickedImage.readAsBytes();
                          setState(() {
                            image = imagebytes;
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
                        onSubmit();
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
      ),
    );
  }
}
