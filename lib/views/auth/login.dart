import 'package:flutter/material.dart';
import 'package:swap/services/service.dart';
import 'package:swap/views/source/assets_app.dart';
import 'package:swap/views/source/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColors.primaryColorMainApp),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned.fill(
            top: 100,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.all(0),
                child: Text(
                  "Welcome to Star Wars Character Enciclopedia",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "OpenSans800",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.7,
                child: Column(
                  children: [
                    Text(
                      "Sign in with email",
                      style: TextStyle(
                        fontFamily: "OpenSans500",
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        // hintText: lang("(Contoh: 08531231231 / nama@domain.com)"),
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: "OpenSans400",
                        ),
                        labelStyle: TextStyle(
                          fontFamily: "OpenSans400",
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.6),
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.6),
                            width: 1,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                      ),
                      controller: emailController,
                      // focusNode: _emailAndPhoneFocusNode,
                      // onChanged: (value) {
                      //   setState(() {
                      //     _validateEmail(value);
                      //   });
                      // },
                      keyboardType: TextInputType.emailAddress,
                      // onFieldSubmitted: (String value) => FocusScope.of(context).requestFocus(_passwordFocusNode),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        // hintText: lang("(Contoh: 08531231231 / nama@domain.com)"),
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: "OpenSans400",
                        ),
                        labelStyle: TextStyle(
                          fontFamily: "OpenSans400",
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.6),
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.6),
                            width: 1,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                      ),
                      controller: passwordController,
                      // focusNode: _emailAndPhoneFocusNode,
                      // onChanged: (value) {
                      //   setState(() {
                      //     _validateEmail(value);
                      //   });
                      // },
                      keyboardType: TextInputType.emailAddress,
                      // onFieldSubmitted: (String value) => FocusScope.of(context).requestFocus(_passwordFocusNode),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Or Sign in with",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "OpenSans500",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Services.signInWithGoogle();
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: ExactAssetImage(
                              AssetsApp.googleLogoImg,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                margin: EdgeInsets.symmetric(
                  horizontal: 36,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Do not have an account ?",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "OpenSans400",
                          ),
                        ),
                        Text(
                          " Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "OpenSans700",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () async {
                        await Services.signUpEmail(
                            emailController.text, passwordController.text);
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontFamily: "OpenSans800",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
