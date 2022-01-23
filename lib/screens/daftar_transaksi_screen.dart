import 'package:flutter/material.dart';
import 'package:rpl_ekajaya/constants/padding.dart';
import 'package:rpl_ekajaya/data/transaksi_data.dart';
import 'package:intl/intl.dart';

class DaftarTransaksiScreen extends StatelessWidget {
  const DaftarTransaksiScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    final _appBar = AppBar(
      title: const Text("Daftar Transaksi"),
      centerTitle: true,
    );

    Widget _listCard({
      required String id,
      required String namaBarang,
      required String namaPembeli,
      required String tanggalTransaksi,
    }) {
      return Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: SizedBox(
                width: 60,
                child: Text(
                  id,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),  
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                  ),
                  child: Text(
                    namaBarang,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    namaPembeli,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    tanggalTransaksi,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 4,
            left: horizontalPadding,
            right: horizontalPadding,
          ),
          child: ListView.builder(
            itemCount: dataTransaksi.length,
            itemBuilder: (context, index) {
              return _listCard(
                id: '${dataTransaksi[index].idTransaksi}',
                namaBarang: dataTransaksi[index].namaBarang,
                namaPembeli: dataTransaksi[index].namaPembeli,
                tanggalTransaksi: DateFormat("dd/mm/yyyy").format(
                  dataTransaksi[index].tanggalTransaksi,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
