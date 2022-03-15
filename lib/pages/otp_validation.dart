import 'package:dealsapp/commonwidget/global_widget.dart';
import 'package:dealsapp/pages/home.dart';
import 'package:dealsapp/pages/widget/header_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _pinVerified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200.0,
              child: const HeaderWidget(
                200.0,
                false,
                Icons.credit_card,
              ),
            ),
            SafeArea(
              child: Container(
                margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Verification',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Enter the OTP sent to your registered email/mobile number',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  OTPTextField(
                    length: 4,
                    width: MediaQuery.of(context).size.width * 0.8, // 240.0
                    // width: 240.0,
                    fieldStyle: FieldStyle.underline,
                    fieldWidth: 50.0,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.redAccent,
                    ),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    onChanged: (pin) {
                      setState(() {
                        _pinVerified = true;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Didn\'t receive the OTP? ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                        TextSpan(
                          text: 'Resend',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.redAccent,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    GlobalWidget().showAlertDialog(
                                  'Resend OTP',
                                  'Are you sure you want to resend the OTP?',
                                  context,
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              decoration: _pinVerified
                  ? GlobalWidget()
                      .buttonDecoration(context, "#F74949", "#F73849")
                  : GlobalWidget()
                      .buttonDecoration(context, "#1b1b28", "#eaeaea"),
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                  child: Text(
                    'Verify'.toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                onPressed: _pinVerified
                    ? () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                            (Route<dynamic> route) => false);
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
