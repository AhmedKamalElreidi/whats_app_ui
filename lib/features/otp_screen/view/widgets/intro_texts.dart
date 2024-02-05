// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_ui/core/utils/colors.dart';
import 'package:whats_app_ui/features/otp_screen/view_model/phone_auth/phone_auth_cubit.dart';
import 'package:whats_app_ui/features/otp_screen/view_model/phone_auth/phone_auth_state.dart';

class IntroTexts extends StatelessWidget {
  // late String phoneNumber;
  const IntroTexts({
    Key? key,
    // required this.phoneNumber,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
      builder: (context, state) {
        var cubit = PhoneAuthCubit.get(context);
        return Column(
          children: [
            const Text(
              "Verify your phone number",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              child: RichText(
                text: TextSpan(
                  text: 'Enter your 6 digit code numbers sent to ',
                  style: const TextStyle(
                      color: Colors.black, fontSize: 18, height: 1.4),
                  children: <TextSpan>[
                    TextSpan(
                      text: cubit.phoneController.text,
                      style: const TextStyle(
                        color: AppColors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
