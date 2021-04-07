import 'package:facility_app/controllers/controllers.dart';
import 'package:facility_app/helpers/theme.dart';
import 'package:facility_app/views/phone_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  static const routeName = 'login_screen';

  final AuthController _authController = Get.find();

  final formKey = new GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String email, password;

  handleFormSubmit() async {
    if (this.formKey.currentState.validate()) {
      await _authController.login(
          emailController.text, passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.size.height,
        width: Get.size.width,
        child: Form(
          key: formKey,
          child: _buildLoginForm(),
        ),
      ),
    );
  }

  _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: ListView(
        children: [
          Container(
            height: Get.size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 140.0,
                  width: 200.0,
                  child: Center(
                    child: Image.asset('assets/cbh-logo.png'),
                  ),
                ),
                Column(
                  children: [
                    TextFormField(
                      autocorrect: false,
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: kSubtitleStyle,
                        errorStyle: TextStyle(
                          color: Colors.deepOrange,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: kBlack, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: kBlack, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: kBlack, width: 1.0),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      onChanged: (value) {
                        this.email = value;
                      },
                      validator: (value) =>
                          value.isEmpty ? 'Email is required' : null,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                        controller: passwordController,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: kSubtitleStyle,
                          errorStyle: TextStyle(
                            color: Colors.deepOrange,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: kBlack, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: kBlack, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: kBlack, width: 1.0),
                          ),
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          this.password = value;
                        },
                        validator: (value) =>
                            value.isEmpty ? 'Password is required' : null),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    if (_authController.loading.value != true) {
                      handleFormSubmit();
                    }
                  },
                  child: Container(
                    height: 60.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(5.0),
                      shadowColor: Colors.lightBlueAccent,
                      color: kBlack,
                      elevation: 7.0,
                      child: Center(
                        child: Obx(() => _authController.loading.value == true
                            ? Text(
                                'PROCESSING...',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _authController.loginType.value = 'PHONE';
                  },
                  child: Container(
                    height: 60.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(5.0),
                      shadowColor: Colors.lightBlueAccent,
                      color: kBlack,
                      elevation: 7.0,
                      child: Center(
                          child: Text(
                        'Proceed with phone number',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
