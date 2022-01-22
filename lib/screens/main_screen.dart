import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpl_ekajaya/widgets/card_widget.dart';

class MainScreen extends StatelessWidget {
  final bool isPenjual;
  static const _horizontalPadding = 16.0;
  const MainScreen({Key? key, required this.isPenjual}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _penjualPage() {
      final _appBar = AppBar(
        title: const Text("Data Barang"),
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
          child: Column(
            children: [],
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

      final _searchPembeli = TextField(
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
                  child: _searchPembeli,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: _horizontalPadding,
                  ),
                  child: Flexible(
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      children: [
                        CardWidget(
                            image: "",
                            nama: "nama",
                            kategori: "kategori",
                            harga: "harga"),
                      ],
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
