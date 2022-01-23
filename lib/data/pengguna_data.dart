class PenggunaData {
  PenggunaData({
    required this.nama,
    required this.alamat,
  });

  final String nama;
  final String alamat;
}

List<PenggunaData> penggunaData = [
  PenggunaData(
    nama: 'Andi',
    alamat: 'Jalan Mawar No 69',
  ),
  PenggunaData(
    nama: 'Budi',
    alamat: 'Jalan Anggrek No 69',
  ),
  PenggunaData(
    nama: 'Celiboy',
    alamat: 'Jalan Batu No 69',
  ),
  PenggunaData(
    nama: 'Dadang',
    alamat: 'Jalan Kapuk No 69',
  ),
  PenggunaData(
    nama: 'Esa',
    alamat: 'Jalan Gunung Agung No 69',
  ),
  PenggunaData(
    nama: 'Fanny',
    alamat: 'Jalan Gatot Subroto No 69',
  ),
];

PenggunaData myData = penggunaData[0];
