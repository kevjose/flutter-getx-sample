import 'package:facility_app/controllers/controllers.dart';
import 'package:facility_app/helpers/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PhoneLoginScreen extends StatelessWidget {
  static const routeName = 'phone_login_screen';

  final AuthController _authController = Get.find();

  final formKey = new GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  String email, password;

  handleFormSubmit() async {
    if (this.formKey.currentState.validate()) {
      await _authController.submitPhoneNumber(phoneController.text);
    }
    // _authController.submitOTP('000000');
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
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Phone',
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
                      textCapitalization: TextCapitalization.none,
                      onChanged: (value) {
                        this.email = value;
                      },
                      validator: (value) =>
                          value.isEmpty ? 'Phone is required' : null,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
