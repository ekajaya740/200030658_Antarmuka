import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String image;
  final String nama;
  final String kategori;
  final String harga;

  CardWidget({
    Key? key,
    required this.image,
    required this.nama,
    required this.kategori,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    final _cardTitleTextStyle = TextStyle(
      color: Colors.white,
    );
    final _cardKategoriTextStyle = TextStyle(
      color: Colors.white,
    );
    final _cardHargaTextStyle = TextStyle(
      color: Colors.white,
    );

    return Card(
      semanticContainer: false,
      color: Colors.green.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.network(image),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
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
                  harga,
                  style: _cardHargaTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
