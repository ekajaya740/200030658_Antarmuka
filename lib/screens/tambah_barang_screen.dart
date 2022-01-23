import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpl_ekajaya/constants/padding.dart';
import 'package:rpl_ekajaya/constants/routes.dart';

class TambahBarangScreen extends StatefulWidget {
  const TambahBarangScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<StatefulWidget> createState() => _TambahBarangScreen();
}

class _TambahBarangScreen extends State<TambahBarangScreen> {
  final List _kategori = ['Logam', 'Plastik', 'Kaca', 'Karet'];

  dynamic _initialDropDownValue;

  TextEditingController? _namaController;
  TextEditingController? _hargaController;
  TextEditingController? _stokController;

  @override
  void initState() {
    _initialDropDownValue = _kategori[0];
    _namaController = TextEditingController();
    _hargaController = TextEditingController();
    _stokController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQueryH = MediaQuery.of(context).size.height;

    final _appBar = AppBar(
      title: const Text("Tambah Barang"),
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
                              decoration: const InputDecoration(
                                  hintText: 'Nama Barang'),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'Harga Barang'),
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
                              decoration: const InputDecoration(
                                  hintText: 'Stok Barang'),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              enabled: false,
                              decoration: const InputDecoration(
                                hintText: 'Upload Gambar',
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
