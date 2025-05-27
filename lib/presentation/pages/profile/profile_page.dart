import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/submit_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/bottombars/custom_bottom_navigation_bar.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/text_fields/input_text_field.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/elements/profile_picker.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/uo_text_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  void onSubmit(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Details',
          style: mtextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(index: 4),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                ProfilePicker(onPressed: () {}),

                TitleText(text: 'Personal Details'),

                InputTextField(
                  obscure: false,
                  title: 'Email Address',
                  controller: TextEditingController(),
                  hint: 'type email',
                ),

                InputTextField(
                  obscure: true,
                  title: 'Password',
                  controller: TextEditingController(),
                  hint: 'type password',
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: UOTextButton(
                    text: 'Change Password',
                    fontSize: 12,
                    onPressed: () {},
                  ),
                ),
                divide(),
                TitleText(text: 'Business Address Details'),
                InputTextField(
                  obscure: false,
                  title: 'Pincode',
                  controller: TextEditingController(),
                  hint: 'type pincode',
                ),
                InputTextField(
                  obscure: false,
                  title: 'Address',
                  controller: TextEditingController(),
                  hint: 'type address',
                ),
                InputTextField(
                  obscure: false,
                  title: 'City',
                  controller: TextEditingController(),
                  hint: 'type city',
                ),
                InputTextField(
                  obscure: false,
                  title: 'State',
                  controller: TextEditingController(),
                  hint: 'type state',
                ),
                InputTextField(
                  obscure: false,
                  title: 'Country',
                  controller: TextEditingController(),
                  hint: 'type country',
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
    );
  }

  Divider divide() {
    return Divider(thickness: 1, color: Color.fromARGB(255, 196, 196, 196));
  }
}

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: mtextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }
}
