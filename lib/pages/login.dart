import 'package:dealsapp/pages/registration.dart';
import 'package:dealsapp/pages/forgotpassword.dart';
import 'package:dealsapp/pages/widget/header_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    /// API calls
    /// Default values
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar to load the title bar for an app, it must be used within the Scaffold Class
      // appBar: AppBar(
      //   title: const Text('Login'),
      //   centerTitle: true,
      //   backgroundColor: Colors.redAccent,
      // ),

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // for scrollable page or action
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.0,
                child: const HeaderWidget(200.0, false, Icons.credit_card),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      children: [
                        const Text(
                          'Welcome Deals!',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigoAccent,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'Login to your account',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  hintText: 'Enter your email',
                                  prefixIcon: const Icon(Icons.email),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                // validator: (value) {
                                //   if (value == '' && value == null) {
                                //     // use regular expression
                                //     return 'Please enter your email id';
                                //   }
                                //   return null;
                                // },
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              TextFormField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  hintText: 'Enter your password',
                                  prefixIcon: const Icon(Icons.lock),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                // validator: (value) {
                                //   if (value == '' &&
                                //       value == null &&
                                //       value!.isEmpty) {
                                //     // use regular expression
                                //     return 'Please enter your password';
                                //   }
                                //   return null;
                                // },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.indigoAccent,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPasswordScreen(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child:
                                    // TextButton, FlatButton, RaisedButton, OutlineButton, ElevatedButton,
                                    // IconButton
                                    ElevatedButton(
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(_emailController.text +
                                            ' ' +
                                            _passwordController.text),
                                      ),
                                    );
                                    // if (_formKey.currentState!.validate()) {
                                    //   Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => SplashScreen(
                                    //           title: _emailController.text),
                                    //     ),
                                    //   );
                                    // } else {
                                    //   ScaffoldMessenger.of(context).showSnackBar(
                                    //     const SnackBar(
                                    //       content:
                                    //           Text('Please enter valid data'),
                                    //     ),
                                    //   );
                                    // }
                                  },
                                ),
                              ),
                              Container(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                          text: 'Don\'t have an account?'),
                                      TextSpan(
                                        text: 'sign up',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const RegistrationScreen(),
                                              ),
                                            );
                                          },
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigoAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                margin: const EdgeInsets.fromLTRB(
                                  10.0,
                                  20.0,
                                  10.0,
                                  20.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
