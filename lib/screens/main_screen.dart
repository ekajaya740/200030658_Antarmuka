import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpl_ekajaya/constants/padding.dart';
import 'package:rpl_ekajaya/constants/routes.dart';
import 'package:rpl_ekajaya/data/barang_data.dart';
import 'package:rpl_ekajaya/data/pengguna_data.dart';
import 'package:rpl_ekajaya/screens/beli_screen.dart';
import 'package:rpl_ekajaya/screens/cari_barang_screen.dart';
import 'package:rpl_ekajaya/screens/ubah_barang_screen.dart';
import 'package:rpl_ekajaya/widgets/barang_card_widget.dart';

class MainScreen extends StatefulWidget {
  final bool isPenjual;
  const MainScreen({
    Key? key,
    required this.isPenjual,
  }) : super(
          key: key,
        );

  @override
  State<MainScreen> createState() => _MainScreenState(
        isPenjual: isPenjual,
      );
}

class _MainScreenState extends State<MainScreen> {
  bool _isDelete = false;

  final bool isPenjual;

  _MainScreenState({
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
      PopupMenuItem<int> _popUpMenuItem({
        required IconData icon,
        required String text,
        required int value,
        void Function()? onTap,
      }) {
        return PopupMenuItem<int>(
          value: value,
          onTap: onTap,
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.green.shade900,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                text,
                style: TextStyle(color: Colors.green.shade900),
              ),
            ],
          ),
        );
      }

      final _appBar = AppBar(
        title: Text(_isDelete ? 'Hapus Data Barang' : 'Data Barang'),
        centerTitle: _isDelete ? false : true,
        leading: _isDelete
            ? null
            : IconButton(
                icon: const Icon(
                  Icons.account_circle,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, ubahDataPenggunaRoute);
                },
              ),
        actions: _isDelete
            ? [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isDelete = false;
                    });
                  },
                  icon: const Icon(
                    Icons.save_rounded,
                  ),
                ),
              ]
            : [
                PopupMenuButton(
                  onSelected: (res) {
                    switch (res) {
                      case 0:
                        Navigator.pushNamed(context, daftarTransaksiRoute);
                        break;
                      case 1:
                        setState(() {
                          _isDelete = true;
                        });
                        break;
                      case 2:
                        Navigator.pushNamed(context, tambahBarangRoute);
                        break;
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                  itemBuilder: (context) => [
                    _popUpMenuItem(
                      value: 0,
                      icon: Icons.assignment_outlined,
                      text: "Daftar Transaksi",
                    ),
                    _popUpMenuItem(
                      value: 1,
                      icon: Icons.edit_rounded,
                      text: "Hapus Barang",
                    ),
                    _popUpMenuItem(
                      value: 2,
                      icon: Icons.add_rounded,
                      text: "Tambah Barang",
                    ),
                  ],
                ),
              ],
      );
      final _search = TextField(
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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CariBarangScreen(
                isPenjual: isPenjual,
              ),
            ),
          );
        },
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
                      isVisible: _isDelete,
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
      final _appBar = AppBar(
        title: const Text("Recycle Shop"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.account_circle,
          ),
          onPressed: () {
            Navigator.pushNamed(context, ubahDataPenggunaRoute);
          },
        ),
      );
      final _search = TextField(
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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CariBarangScreen(isPenjual: isPenjual),
            ),
          );
        },
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
                      isVisible: _isDelete,
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

    if (widget.isPenjual) {
      return _penjualPage();
    } else {
      return _pembeliPage();
    }
  }
}
