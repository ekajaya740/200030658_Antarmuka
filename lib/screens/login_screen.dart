import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rpl_ekajaya/constants/padding.dart';
import 'package:rpl_ekajaya/constants/routes.dart';
import 'package:rpl_ekajaya/data/pengguna_data.dart';

class LoginScreen extends StatefulWidget {
  static const _logoStr = "assets/images/app_logo.png";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _username;
  String? _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _mediaQueryH = MediaQuery.of(context).size.height;

    final _textFormFieldTextStyle = GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 24,
      ),
    );

    final _loginButton = ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          for (var e in listPengguna) {
            if (e.username == _username && e.password == _password) {
              setState(() {
                myData = e;
              });
              Navigator.pushNamed(context, mainPembeliRoute);
            }
          }
        }
      },
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
      String? Function(String?)? validator,
    }) {
      return TextFormField(
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.center,
        style: _textFormFieldTextStyle,
        decoration: InputDecoration(
          hintText: hint,
        ),
        keyboardType: textInputType,
        obscureText: obscure ?? false,
        validator: validator,
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
                      Image.asset(LoginScreen._logoStr),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _textFormField(
                                hint: "Username",
                                validator: (val) {
                                  if (val!.isNotEmpty) _username = val;
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              _textFormField(
                                hint: "Password",
                                obscure: true,
                                textInputType: TextInputType.visiblePassword,
                                validator: (val) {
                                  if (val!.isNotEmpty) _password = val;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
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
