import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpl_ekajaya/constants/padding.dart';
import 'package:rpl_ekajaya/constants/routes.dart';

class BeliScreen extends StatefulWidget {
  final String namaBarang;
  final int hargaBarang;
  final String alamat;

  BeliScreen({
    required this.namaBarang,
    required this.hargaBarang,
    required this.alamat,
  });
  @override
  State<StatefulWidget> createState() => _BeliScreen(
        namaBarang: namaBarang,
        hargaBarang: hargaBarang,
        alamat: alamat,
      );
}

class _BeliScreen extends State<BeliScreen> {
  final String namaBarang;
  final int hargaBarang;
  final String alamat;

  TextEditingController? _jumlahController;
  int? _harga;

  @override
  void initState() {
    _jumlahController = TextEditingController();
    _harga = 0;
    super.initState();
  }

  _BeliScreen({
    required this.namaBarang,
    required this.hargaBarang,
    required this.alamat,
  });

  @override
  Widget build(BuildContext context) {
    final _mediaQueryH = MediaQuery.of(context).size.height;

    TextStyle _contentTextStyle({
      Color? color,
    }) {
      return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: color,
      );
    }

    final _appBar = AppBar(
      title: const Text("Beli Barang"),
      centerTitle: true,
    );

    Widget _rowData({
      required String title,
      required Widget content,
    }) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
            content,
          ],
        ),
      );
    }

    ElevatedButton _elevatedButton({
      required String type,
      Color? primary,
      required void Function()? onPressed,
    }) {
      return ElevatedButton(
        onPressed: onPressed,
        child: Text(type),
        style: ElevatedButton.styleFrom(
          primary: primary,
        ),
      );
    }

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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          _rowData(
                            title: 'Nama Barang',
                            content: Text(
                              namaBarang,
                              style: _contentTextStyle(),
                            ),
                          ),
                          _rowData(
                            title: 'Harga Barang',
                            content: Text(
                              '$hargaBarang',
                              style: _contentTextStyle(),
                            ),
                          ),
                          _rowData(
                            title: 'Jumlah Pembelian',
                            content: SizedBox(
                              width: 100,
                              height: 50,
                              child: TextField(
                                controller: _jumlahController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'Jumlah',
                                ),
                                onChanged: (val) {
                                  setState(() {
                                    if (val != '') {
                                      _harga = hargaBarang * int.parse(val);
                                    } else {
                                      _harga = 0;
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                          _rowData(
                            title: 'Alamat',
                            content: Wrap(
                              children: [
                                Text(
                                  alamat,
                                  style: _contentTextStyle(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          _rowData(
                            title: 'Total',
                            content: Text(
                              'Rp$_harga',
                              style: _contentTextStyle(
                                color: Colors.green.shade500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          _elevatedButton(
                            type: "Beli",
                            onPressed: () {
                              if (_jumlahController!.text != '') {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    mainPembeliRoute, (route) => false);
                              }
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          _elevatedButton(
                            type: "Batal",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            primary: Colors.red.shade900,
                          ),
                          const SizedBox(
                            height: 40,
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
    );
  }
}
