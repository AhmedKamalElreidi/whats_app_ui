// // ignore_for_file: prefer_const_constructors

// import 'package:animated_conditional_builder/animated_conditional_builder.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:whats_app_ui/core/helper/app-functions.dart';
// import 'package:whats_app_ui/core/utils/colors.dart';
// import 'package:whats_app_ui/core/widgets/custom_button.dart';
// import 'package:whats_app_ui/features/home/view/home_view.dart';
// import 'package:whats_app_ui/features/otp_screen/view/widgets/intro_texts.dart';
// import 'package:whats_app_ui/features/otp_screen/view_model/phone_auth/phone_auth_cubit.dart';
// import 'package:whats_app_ui/features/otp_screen/view_model/phone_auth/phone_auth_state.dart';

// class OtpScreen extends StatelessWidget {
//   // late String phoneNumber;
//   OtpScreen({super.key});
//   // late String otpCode;
//   late String otpCode;
//   Widget _buildPinCodeFields(BuildContext context) {
//     return Expanded(
//       child: PinCodeTextField(
//         appContext: context,
//         autoFocus: true,
//         cursorColor: AppColors.primaryColor,
//         keyboardType: TextInputType.number,
//         length: 6,
//         obscureText: false,
//         animationType: AnimationType.scale,
//         pinTheme: PinTheme(
//           shape: PinCodeFieldShape.box,
//           borderRadius: BorderRadius.circular(5),
//           fieldHeight: 50,
//           fieldWidth: 40,
//           borderWidth: 1,
//           activeColor: AppColors.primaryColor,
//           inactiveColor: AppColors.primaryColor,
//           inactiveFillColor: Colors.white,
//           activeFillColor: AppColors.lightGreen,
//           selectedColor: AppColors.primaryColor,
//           selectedFillColor: Colors.white,
//         ),
//         animationDuration: const Duration(milliseconds: 300),
//         backgroundColor: Colors.white,
//         enableActiveFill: true,
//         onCompleted: (submitedCode) {
//           otpCode = submitedCode;
//           print("Completed");
//         },
//         onChanged: (value) {
//           print(value);
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: BlocProvider(
//         create: (context) => PhoneAuthCubit(),
//         child: BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
//           listener: (context, state) {
//             if (state is PhoneOTPVerified) {
//               // AppFunctions.popNavigate(context: context);
//               AppFunctions.navigateAndReplacement(
//                   context: context, navigatedScreen: HomeView());
//             }
//             if (state is ErrorOcurred) {
//               // AppFunctions.popNavigate(context: context);
//               AppFunctions.showToast(text: state.errMessage);
//             }
//           },
//           builder: (context, state) {
//             var cubit = PhoneAuthCubit.get(context);
//             return Scaffold(
//               backgroundColor: Colors.white,
//               body: Container(
//                 margin: EdgeInsets.symmetric(horizontal: 32, vertical: 88),
//                 child: Column(
//                   children: [
//                     IntroTexts(),
//                     SizedBox(
//                       height: 70,
//                     ),
//                     _buildPinCodeFields(context),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     AnimatedConditionalBuilder(
//                       condition: state is Loading,
//                       builder: (BuildContext context) =>
//                           const Center(child: CircularProgressIndicator()),
//                       fallback: (BuildContext context) => Align(
//                         alignment: Alignment.centerRight,
//                         child: CustomButton(
//                           text: 'Verify',
//                           onTap: () {
//                             cubit.submitOTP(otpCode);
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:whats_app_ui/core/helper/app-functions.dart';
import 'package:whats_app_ui/core/utils/colors.dart';
import 'package:whats_app_ui/core/widgets/custom_button.dart';
import 'package:whats_app_ui/features/home/view/home_view.dart';
import 'package:whats_app_ui/features/otp_screen/view_model/phone_auth/phone_auth_cubit.dart';
import 'package:whats_app_ui/features/otp_screen/view_model/phone_auth/phone_auth_state.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  // final phoneNumber;

  OtpScreen({
    Key? key,
  }) : super(key: key);

  String? otpCode;

  Widget _buildIntroTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Verify your phone number',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: RichText(
            text: const TextSpan(
              text: 'Enter your 6 digit code numbers sent to ',
              style: TextStyle(color: Colors.black, fontSize: 18, height: 1.4),
              children: <TextSpan>[
                TextSpan(
                  text: '',
                  style: TextStyle(color: AppColors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // void showProgressIndicator(BuildContext context) {
  //   AlertDialog alertDialog = const AlertDialog(
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //     content: Center(
  //       child: CircularProgressIndicator(
  //         valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
  //       ),
  //     ),
  //   );

  // showDialog(
  //   barrierColor: Colors.white.withOpacity(0),
  //   barrierDismissible: false,
  //   context: context,
  //   builder: (context) {
  //     return alertDialog;
  //   },
  // );
  // }

  Widget _buildPinCodeFields(BuildContext context) {
    return Expanded(
      child: PinCodeTextField(
        appContext: context,
        autoFocus: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        length: 6,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          borderWidth: 1,
          activeColor: AppColors.blue,
          inactiveColor: AppColors.blue,
          inactiveFillColor: Colors.white,
          activeFillColor: AppColors.lightBlue,
          selectedColor: AppColors.blue,
          selectedFillColor: Colors.white,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        onCompleted: (submitedCode) {
          otpCode = submitedCode;
          print("Completed");
        },
        onChanged: (value) {
          otpCode = value;
          print(value);
        },
      ),
    );
  }

  // void _login(BuildContext context) {
  //   BlocProvider.of<PhoneAuthCubit>(context).submitOTP(otpCode!);
  // }

  // Widget _buildVrifyButton(BuildContext context) {
  //   return Align(
  //     alignment: Alignment.centerRight,
  //     child: CustomButton(
  //       text: 'Verify',
  //       onTap: () {
  //         showProgressIndicator(context);

  //         _login(context);
  //       },
  //     ),
  //   );
  // }

  // Widget _buildPhoneVerificationBloc() {
  //   return BlocListener<PhoneAuthCubit, PhoneAuthState>(
  //     listenWhen: (previous, current) {
  //       return previous != current;
  //     },
  //     listener: (context, state) {
  //       if (state is Loading) {
  //         showProgressIndicator(context);
  //       }

  //       if (state is PhoneOTPVerified) {
  //         Navigator.pop(context);
  //         AppFunctions.navigateAndReplacement(
  //             context: context, navigatedScreen: const HomeView());
  //       }

  //       if (state is ErrorOccurred) {
  //         //Navigator.pop(context);
  //         String errorMsg = (state).errorMsg;
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text(errorMsg),
  //             backgroundColor: Colors.black,
  //             duration: const Duration(seconds: 3),
  //           ),
  //         );
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
            if (state is PhoneOTPVerified) {
              // AppFunctions.popNavigate(context: context);
              AppFunctions.navigateAndReplacement(
                  context: context, navigatedScreen: const HomeView());
            }
            if (state is ErrorOccurred) {
              // AppFunctions.popNavigate(context: context);
              AppFunctions.showToast(text: state.errorMsg);
            }
          },
          builder: (context, state) {
            var cubit = PhoneAuthCubit.get(context);

            return Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 88),
                child: Column(
                  children: [
                    _buildIntroTexts(),
                    const SizedBox(
                      height: 70,
                    ),
                    _buildPinCodeFields(context),
                    const SizedBox(
                      height: 20,
                    ),
                    AnimatedConditionalBuilder(
                      condition: state is Loading,
                      builder: (BuildContext context) =>
                          const Center(child: CircularProgressIndicator()),
                      fallback: (BuildContext context) => Align(
                        alignment: Alignment.centerRight,
                        child: CustomButton(
                          text: 'Verify',
                          onTap: () {
                            cubit.submitOTP(otpCode!);
                          },
                        ),
                      ),
                    ),
                    // _buildVrifyButton(context),
                    // _buildPhoneVerificationBloc(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
