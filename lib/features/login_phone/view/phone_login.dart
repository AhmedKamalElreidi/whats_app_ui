// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable
import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_ui/core/helper/app-functions.dart';
import 'package:whats_app_ui/core/widgets/custom_button.dart';
import 'package:whats_app_ui/features/login_phone/view/widgets/intro_texts.dart';
import 'package:whats_app_ui/features/login_phone/view/widgets/phone_form_field.dart';
import 'package:whats_app_ui/features/otp_screen/view/otp_screen.dart';
import 'package:whats_app_ui/features/otp_screen/view_model/phone_auth/phone_auth_cubit.dart';
import 'package:whats_app_ui/features/otp_screen/view_model/phone_auth/phone_auth_state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();
  // late String phoneNumber;

  // void showProgressIndicator(BuildContext context) {
  //   AlertDialog alertDialog = AlertDialog(
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //     content: Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );
  // }

  // Widget _buildPhoneNumberSubmitedBloc() {
  //   return BlocListener<PhoneAuthCubit, PhoneAuthState>(
  //     listenWhen: (previous, current) {
  //       return previous != current;
  //     },
  //     listener: (context, state) {
  //       if (state is Loading) {
  //         showProgressIndicator(context);
  //       }
  //     },
  //     child: Container(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => PhoneAuthCubit(),
        child: BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
          listener: (context, state) {
            if (state is PhoneNumberSubmited) {
              // AppFunctions.popNavigate(context: context);
              AppFunctions.navigateTo(
                  context: context,
                  navigatedScreen: OtpScreen(
                      // phoneNumber: phoneNumber,
                      ));
            }
            if (state is ErrorOccurred) {
              // AppFunctions.popNavigate(context: context);
              AppFunctions.showToast(text: state.errorMsg);
            }
          },
          builder: (context, state) {
            var cubit = PhoneAuthCubit.get(context);
            return Scaffold(
              backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
              body: Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Form(
                    key: _phoneFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // texts
                        IntroTexts(),
                        // phone field
                        PhoneFormField(),
                        // next button
                        AnimatedConditionalBuilder(
                          condition: state is Loading,
                          builder: (BuildContext context) =>
                              const Center(child: CircularProgressIndicator()),
                          fallback: (BuildContext context) => Align(
                              alignment: Alignment.centerRight,
                              child: CustomButton(
                                text: 'Next',
                                onTap: () {
                                  if (_phoneFormKey.currentState!.validate()) {
                                    _phoneFormKey.currentState!.save();
                                    cubit.submitPhoneNumber(
                                        cubit.phoneController.text);
                                  }
                                },
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // _buildPhoneNumberSubmitedBloc(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
