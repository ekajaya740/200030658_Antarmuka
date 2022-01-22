import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpl_ekajaya/data/barang_data.dart';
import 'package:rpl_ekajaya/widgets/card_widget.dart';

class MainScreen extends StatelessWidget {
  final bool isPenjual;
  static const _horizontalPadding = 16.0;
  const MainScreen({Key? key, required this.isPenjual}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    );

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
      final _appBar = AppBar(
        title: const Text("Data Barang"),
        // centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.account_circle,
          ),
          onPressed: () {},
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons
                .more_vert_rounded), //don't specify icon if you want 3 dot menu
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: [
                    Icon(Icons.assignment_rounded),
                    Text(
                      "Daftar Transaksi",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: [
                    Icon(Icons.edit_rounded),
                    Text(
                      "Edit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: [
                    Icon(Icons.add_rounded),
                    Text(
                      "Tambah Barang",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
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
                    _horizontalPadding,
                    14,
                    _horizontalPadding,
                    24,
                  ),
                  child: _search,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: _horizontalPadding,
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
                          CardWidget(
                        nama: data[index].nama,
                        harga: data[index].harga,
                        image: data[index].uriImage,
                        kategori: data[index].kategori,
                        button: _button(
                          type: 'Beli Barang',
                          onPressed: () {},
                        ),
                      ),
                      itemCount: data.length,
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
                    _horizontalPadding,
                    14,
                    _horizontalPadding,
                    24,
                  ),
                  child: _search,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: _horizontalPadding,
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
                          CardWidget(
                        nama: data[index].nama,
                        harga: data[index].harga,
                        image: data[index].uriImage,
                        kategori: data[index].kategori,
                        button: _button(
                          type: 'Beli Barang',
                          onPressed: () {},
                        ),
                      ),
                      itemCount: data.length,
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
