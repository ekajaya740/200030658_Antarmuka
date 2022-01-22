import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  static const _logoStr = "assets/images/app_logo.png";
  static const _horizontalPadding = 16.0;

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mediaQueryH = MediaQuery.of(context).size.height;
    final _mediaQueryW = MediaQuery.of(context).size.width;

    final _textFormFieldTextStyle = GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 24,
      ),
    );
    final _loginButton = ElevatedButton(
      onPressed: () {},
      child: const Text("Login"),
    );
    final _registerButton = TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/register');
      },
      child: Text(
        "Register",
        style: TextStyle(
          color: Colors.green.shade900,
        ),
      ),
    );
    TextFormField _textFormField({
      String? hint,
      bool? obscure,
      TextInputType? textInputType,
    }) {
      return TextFormField(
        textAlign: TextAlign.center,
        style: _textFormFieldTextStyle,
        decoration: InputDecoration(
          hintText: hint,
        ),
        keyboardType: textInputType,
        obscureText: obscure ?? false,
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Align(
          child: Builder(
            builder: (context) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(
                  height: _mediaQueryH -
                      (MediaQuery.of(context).padding.top + kToolbarHeight),
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(_logoStr),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: _horizontalPadding,
                        ),
                        child: Form(
                          child: Column(
                            children: [
                              _textFormField(hint: "Username"),
                              const SizedBox(
                                height: 12,
                              ),
                              _textFormField(
                                hint: "Password",
                                obscure: true,
                                textInputType: TextInputType.emailAddress,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: _horizontalPadding,
                        ),
                        child: Column(
                          children: [
                            _loginButton,
                            _registerButton,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
