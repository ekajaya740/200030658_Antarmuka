import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpl_ekajaya/constants/padding.dart';
import 'package:rpl_ekajaya/constants/routes.dart';
import 'package:rpl_ekajaya/data/barang_data.dart';
import 'package:rpl_ekajaya/data/pengguna_data.dart';
import 'package:rpl_ekajaya/screens/beli_screen.dart';
import 'package:rpl_ekajaya/widgets/barang_card_widget.dart';


class MainScreen extends StatelessWidget {
  bool isDelete = false;
  final bool isPenjual;
  MainScreen({
    Key? key,
    required this.isPenjual,
  }) : super(
          key: key,
        );

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
        title: const Text("Data Barang"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.account_circle,
          ),
          onPressed: () {},
        ),
        actions: [
          PopupMenuButton(
            onSelected: (res) {
              switch (res) {
                case 0:
                  Navigator.pushNamed(context, daftarTransaksiRoute);
                  break;
                case 1:
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
                text: "Edit",
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
        onTap: () {},
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
                  child: Flexible(
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
                          onPressed: () {},
                        ),
                      ),
                      itemCount: dataBarang.length,
                    ),
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
          onPressed: () {},
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
        onTap: () {},
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
                  child: Flexible(
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
                                  alamat: myData.alamat,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      itemCount: dataBarang.length,
                    ),
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
