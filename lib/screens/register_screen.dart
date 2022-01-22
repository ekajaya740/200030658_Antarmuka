import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  static const _logoStr = "assets/images/app_logo.png";
  static const _horizontalPadding = 16.0;

  const RegisterScreen({Key? key}) : super(key: key);

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
    final _registerButton = ElevatedButton(
      onPressed: () {},
      child: const Text("Register"),
    );
    final _loginButton = TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/');
      },
      child: Text(
        "Login",
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

    final _appBar = AppBar(
      title: const Text("Register"),
      centerTitle: true,
    );

    return Scaffold(
      appBar: _appBar,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: _horizontalPadding,
                        ),
                        child: Form(
                          child: Column(
                            children: [
                              _textFormField(
                                hint: "Nama",
                                textInputType: TextInputType.name,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              _textFormField(
                                hint: "Email",
                                textInputType: TextInputType.emailAddress,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              _textFormField(
                                hint: "No Telp",
                                textInputType: TextInputType.phone,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              _textFormField(
                                hint: "Username",
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              _textFormField(
                                hint: "Password",
                                obscure: true,
                                textInputType: TextInputType.visiblePassword,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: _horizontalPadding,
                          vertical: 24,
                        ),
                        child: Column(
                          children: [
                            _registerButton,
                            _loginButton,
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
