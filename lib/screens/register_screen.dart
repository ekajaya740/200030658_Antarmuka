import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rpl_ekajaya/constants/routes.dart';
import 'package:rpl_ekajaya/data/pengguna_data.dart';

class RegisterScreen extends StatefulWidget {
  static const _horizontalPadding = 16.0;

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? _nama;
  String? _email;
  String? _noTelp;
  String? _username;
  String? _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double _mediaQueryH = MediaQuery.of(context).size.height;

    final _textFormFieldTextStyle = GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 24,
      ),
    );

    final _registerButton = ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          setState(() {
            listPengguna.add(
              PenggunaData(
                nama: _nama!,
                email: _email!,
                noTelp: _noTelp!,
                username: _username!,
                password: _password!,
                alamat: 'Alamat',
                namaToko: 'Nama Toko',
                noRek: 'No Rekening',
                isPenjual: false,
                foto:
                    'https://lh3.googleusercontent.com/M8AUbgTlaOl6gMTDHh0maDiUXiyKFGlOPjspVoPDTs_Cd5Xujttwk7lvi4FFkCJXREND3edb99cERHc4wKpP4tiGMMekH-_Eva_R9A=w600',
              ),
            );
          });
          Navigator.pushNamed(context, rootRoute);
        }
      },
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
                          horizontal: RegisterScreen._horizontalPadding,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _textFormField(
                                hint: "Nama",
                                textInputType: TextInputType.name,
                                validator: (val) {
                                  _nama = val!;
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              _textFormField(
                                hint: "Email",
                                textInputType: TextInputType.emailAddress,
                                validator: (val) {
                                  if (val!.isNotEmpty) _email = val;
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              _textFormField(
                                hint: "No Telp",
                                textInputType: TextInputType.phone,
                                validator: (val) {
                                  if (val!.isNotEmpty) _noTelp = val;
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
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
                          horizontal: RegisterScreen._horizontalPadding,
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
