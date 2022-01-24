import 'package:flutter/material.dart';
import 'package:rpl_ekajaya/constants/padding.dart';
import 'package:rpl_ekajaya/data/barang_data.dart';
import 'package:rpl_ekajaya/data/pengguna_data.dart';
import 'package:rpl_ekajaya/screens/beli_screen.dart';
import 'package:rpl_ekajaya/screens/ubah_barang_screen.dart';
import 'package:rpl_ekajaya/widgets/barang_card_widget.dart';

class CariBarangScreen extends StatelessWidget {
  final bool isPenjual;

  const CariBarangScreen({
    required this.isPenjual,
  });
  @override
  Widget build(BuildContext context) {
    Widget _button({
      required String type,
      required void Function()? onPressed,
    }) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.amber,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          ),
          onPressed: onPressed,
          child: Text(
            type,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    Widget _penjualPage() {
      final _search = TextField(
        autofocus: true,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            color: Colors.green.shade900,
          ),
          hintText: "Cari Barang",
          hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.green.shade900,
            fontSize: 18,
          ),
        ),
      );
      final _appBar = AppBar(
        title: Text('Cari Barang'),
        centerTitle: true,
      );

      return Scaffold(
        appBar: _appBar,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    horizontalPadding,
                    14,
                    horizontalPadding,
                    24,
                  ),
                  child: _search,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                  ),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      maxCrossAxisExtent: 240,
                      mainAxisExtent: 240,
                    ),
                    itemBuilder: (BuildContext context, int index) =>
                        BarangCardWidget(
                      nama: dataBarang[index].nama,
                      harga: dataBarang[index].harga,
                      image: dataBarang[index].uriImage,
                      kategori: dataBarang[index].kategori,
                      button: _button(
                        type: 'Ubah Barang',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UbahBarangScreen(
                                namaBarang: dataBarang[index].nama,
                                hargaBarang: dataBarang[index].harga,
                                fotoBarang: dataBarang[index].uriImage,
                                kategoriBarang: dataBarang[index].kategori,
                                stokBarang: dataBarang[index].stok,
                              ),
                            ),
                          );
                        },
                      ),
                      isVisible: false,
                    ),
                    itemCount: dataBarang.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget _pembeliPage() {
      final _search = TextField(
        autofocus: true,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            color: Colors.green.shade900,
          ),
          hintText: "Cari Barang",
          hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.green.shade900,
            fontSize: 18,
          ),
        ),
      );
      final _appBar = AppBar(
        title: Text('Cari Barang'),
        centerTitle: true,
      );

      return Scaffold(
        appBar: _appBar,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    horizontalPadding,
                    14,
                    horizontalPadding,
                    24,
                  ),
                  child: _search,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                  ),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      maxCrossAxisExtent: 240,
                      mainAxisExtent: 240,
                    ),
                    itemBuilder: (BuildContext context, int index) =>
                        BarangCardWidget(
                      nama: dataBarang[index].nama,
                      harga: dataBarang[index].harga,
                      image: dataBarang[index].uriImage,
                      kategori: dataBarang[index].kategori,
                      button: _button(
                        type: 'Beli Barang',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BeliScreen(
                                namaBarang: dataBarang[index].nama,
                                hargaBarang: dataBarang[index].harga,
                                alamat: myData!.alamat,
                              ),
                            ),
                          );
                        },
                      ),
                      isVisible: false,
                    ),
                    itemCount: dataBarang.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (isPenjual) {
      return _penjualPage();
    } else {
      return _pembeliPage();
    }
  }
}
