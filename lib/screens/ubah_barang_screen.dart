import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpl_ekajaya/constants/padding.dart';
import 'package:rpl_ekajaya/constants/routes.dart';

class UbahBarangScreen extends StatefulWidget {
  final String namaBarang;
  final int hargaBarang;
  final dynamic kategoriBarang;
  final int stokBarang;
  final String fotoBarang;

  const UbahBarangScreen({
    Key? key,
    required this.namaBarang,
    required this.hargaBarang,
    required this.kategoriBarang,
    required this.stokBarang,
    required this.fotoBarang,
  }) : super(
          key: key,
        );

  @override
  State<StatefulWidget> createState() => _UbahBarangScreen(
        namaBarang: namaBarang,
        hargaBarang: hargaBarang,
        kategoriBarang: kategoriBarang,
        stokBarang: stokBarang,
        fotoBarang: fotoBarang,
      );
}

class _UbahBarangScreen extends State<UbahBarangScreen> {
  final String namaBarang;
  final int hargaBarang;
  final dynamic kategoriBarang;
  final int stokBarang;
  final String fotoBarang;

  _UbahBarangScreen({
    required this.namaBarang,
    required this.hargaBarang,
    required this.kategoriBarang,
    required this.stokBarang,
    required this.fotoBarang,
  });

  final List _kategori = ['Logam', 'Plastik', 'Kaca', 'Karet'];

  dynamic _initialDropDownValue;

  TextEditingController? _namaController;
  TextEditingController? _hargaController;
  TextEditingController? _stokController;

  @override
  void initState() {
    _initialDropDownValue = kategoriBarang;
    _namaController = TextEditingController();
    _hargaController = TextEditingController();
    _stokController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQueryH = MediaQuery.of(context).size.height;

    final _appBar = AppBar(
      title: const Text("Ubah Barang"),
      automaticallyImplyLeading: false,
    );

    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Builder(
            builder: (context) => SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(
                  height: _mediaQueryH -
                      (MediaQuery.of(context).padding.top + kToolbarHeight),
                ),
                child: IntrinsicHeight(
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              decoration: InputDecoration(hintText: namaBarang),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              decoration:
                                  InputDecoration(hintText: 'Rp$hargaBarang'),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.green.shade900),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButton(
                                dropdownColor: Colors.green.shade300,
                                underline: const SizedBox(),
                                borderRadius: BorderRadius.circular(10),
                                elevation: 0,
                                isExpanded: true,
                                items: _kategori
                                    .map(
                                      (e) => DropdownMenuItem(
                                        child: Text(e,
                                            style: const TextStyle(
                                                color: Colors.black)),
                                        value: e,
                                      ),
                                    )
                                    .toList(),
                                value: _initialDropDownValue,
                                onChanged: (val) {
                                  setState(() {
                                    _initialDropDownValue = val;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(hintText: '$stokBarang'),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.green.shade900,
                                  ),
                                ),
                                child: Center(
                                  child: Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Image.network(
                                        fotoBarang,
                                        fit: BoxFit.fill,
                                      ),
                                      const Text('Ubah Foto Barang',
                                          style: TextStyle(
                                              backgroundColor: Colors.white,
                                              color: Colors.black))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  mainPenjualRoute,
                                  (route) => false,
                                );
                              },
                              child: const Text('Simpan'),
                            ),
                            const SizedBox(
                              height: 54,
                            ),
                          ],
                        )
                      ],
                    ),
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
