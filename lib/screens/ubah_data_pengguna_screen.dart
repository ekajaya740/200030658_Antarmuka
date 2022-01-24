import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpl_ekajaya/constants/padding.dart';
import 'package:rpl_ekajaya/data/pengguna_data.dart';
import 'package:rpl_ekajaya/screens/main_screen.dart';

class UbahDataPenggunaScreen extends StatefulWidget {
  const UbahDataPenggunaScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<UbahDataPenggunaScreen> createState() => _UbahDataPenggunaScreenState();
}

class _UbahDataPenggunaScreenState extends State<UbahDataPenggunaScreen> {
  bool isPenjual = myData!.isPenjual;

  String? _nama;
  String? _email;
  String? _noTelp;
  String? _alamat;
  String? _username;
  String? _password;
  String? _namaToko;
  String? _noRekening;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _appBar = AppBar(
      title: const Text("Ubah Data Pengguna"),
      centerTitle: true,
    );
    TextFormField _textFormField({
      required String hint,
      bool? obscure,
      TextInputType? textInputType,
      bool? enabled,
      String? Function(String?)? validator,
    }) {
      return TextFormField(
        textInputAction: TextInputAction.next,
        keyboardType: textInputType,
        obscureText: obscure ?? false,
        enabled: enabled,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
        ),
      );
    }

    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 48),
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.green.shade900,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              myData!.foto,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.amber,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add_rounded,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    children: [
                      _textFormField(
                        hint: myData!.nama,
                        textInputType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _textFormField(
                        hint: myData!.email,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _textFormField(
                        hint: myData!.noTelp,
                        textInputType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _textFormField(
                        hint: myData?.alamat ?? 'Alamat',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _textFormField(
                        hint: myData!.username,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _textFormField(
                        hint: myData!.password,
                        textInputType: TextInputType.visiblePassword,
                        obscure: true,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    horizontalPadding,
                    22,
                    horizontalPadding,
                    2,
                  ),
                  child: Text(
                    'Opsi Penjual',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade900,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Menjadi Penjual',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green.shade900,
                        ),
                      ),
                      Switch(
                          inactiveTrackColor: Colors.black45,
                          value: isPenjual,
                          onChanged: (val) {
                            setState(() {
                              isPenjual = val;
                            });
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    children: [
                      _textFormField(
                        hint: myData!.namaToko,
                        enabled: isPenjual,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _textFormField(
                        hint: myData!.noRek,
                        enabled: isPenjual,
                        textInputType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    horizontalPadding,
                    62,
                    horizontalPadding,
                    24,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        int index = listPengguna.indexWhere(
                            (element) => element.username == myData!.username);
                        listPengguna.elementAt(index).isPenjual = isPenjual;

                        myData = listPengguna.elementAt(index);
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MainScreen(isPenjual: isPenjual)),
                      );
                    },
                    child: const Text('Ubah'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
