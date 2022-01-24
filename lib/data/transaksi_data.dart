import 'package:rpl_ekajaya/data/pengguna_data.dart';

class TransaksiData {
  TransaksiData({
    required this.idTransaksi,
    required this.namaBarang,
    required this.namaPembeli,
    required this.tanggalTransaksi,
  });

  final int idTransaksi;
  final String namaBarang;
  final String namaPembeli;
  final DateTime tanggalTransaksi;
}

List<TransaksiData> dataTransaksi = [
  TransaksiData(
    idTransaksi: 1,
    namaBarang: 'Besi',
    namaPembeli: listPengguna[0].nama,
    tanggalTransaksi: DateTime(2021, 12, 22),
  ),
  TransaksiData(
    idTransaksi: 2,
    namaBarang: 'Besi',
    namaPembeli: listPengguna[1].nama,
    tanggalTransaksi: DateTime(2021, 12, 22),
  ),
  TransaksiData(
    idTransaksi: 3,
    namaBarang: 'Besi',
    namaPembeli: listPengguna[3].nama,
    tanggalTransaksi: DateTime(2021, 12, 22),
  ),
  TransaksiData(
    idTransaksi: 4,
    namaBarang: 'Besi',
    namaPembeli: listPengguna[2].nama,
    tanggalTransaksi: DateTime(2021, 12, 22),
  ),
  TransaksiData(
    idTransaksi: 5,
    namaBarang: 'Besi',
    namaPembeli: listPengguna[4].nama,
    tanggalTransaksi: DateTime(2021, 12, 22),
  ),
  TransaksiData(
    idTransaksi: 6,
    namaBarang: 'Besi',
    namaPembeli: listPengguna[2].nama,
    tanggalTransaksi: DateTime(2021, 12, 22),
  ),
  TransaksiData(
    idTransaksi: 7,
    namaBarang: 'Besi',
    namaPembeli: listPengguna[0].nama,
    tanggalTransaksi: DateTime(2021, 12, 22),
  ),
  TransaksiData(
    idTransaksi: 8,
    namaBarang: 'Besi',
    namaPembeli: listPengguna[0].nama,
    tanggalTransaksi: DateTime(2021, 12, 22),
  ),
  TransaksiData(
    idTransaksi: 9,
    namaBarang: 'Besi',
    namaPembeli: listPengguna[0].nama,
    tanggalTransaksi: DateTime(2021, 12, 22),
  ),
  TransaksiData(
    idTransaksi: 10,
    namaBarang: 'Besi',
    namaPembeli: listPengguna[0].nama,
    tanggalTransaksi: DateTime(2021, 12, 22),
  ),
];
