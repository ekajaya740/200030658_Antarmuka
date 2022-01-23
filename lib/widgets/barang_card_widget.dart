import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BarangCardWidget extends StatelessWidget {
  final String image;
  final String nama;
  final String kategori;
  final int harga;
  final Widget? button;

  BarangCardWidget({
    Key? key,
    required this.image,
    required this.nama,
    required this.kategori,
    required this.harga,
    this.button,
  });

  @override
  Widget build(BuildContext context) {

    const _cardTitleTextStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    const _cardKategoriTextStyle = TextStyle(
      color: Colors.white,
    );
    const _cardHargaTextStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.yellow,
    );

    return Card(
      semanticContainer: false,
      color: Colors.green.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child: Image.network(
                image,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: _cardTitleTextStyle,
                ),
                Text(
                  kategori,
                  style: _cardKategoriTextStyle,
                ),
                Text(
                  'Rp$harga',
                  style: _cardHargaTextStyle,
                ),
              ],
            ),
          ),
          button ?? const SizedBox(),
        ],
      ),
    );
  }
}
