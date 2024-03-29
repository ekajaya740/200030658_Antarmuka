class BarangData {
  BarangData({
    required this.uriImage,
    required this.nama,
    required this.kategori,
    required this.harga,
    required this.stok,
  });

  final String uriImage;
  final String nama;
  final String kategori;
  final int harga;
  final int stok;
}

final List _kategori = ['Logam', 'Plastik', 'Kaca', 'Karet'];

List<BarangData> dataBarang = [
  BarangData(
    uriImage:
        'https://images.unsplash.com/photo-1592438944517-ee7d4fd058c9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    nama: 'Besi',
    kategori: _kategori[0],
    harga: 1000,
    stok: 100,
  ),
  BarangData(
    uriImage:
        'https://images.unsplash.com/photo-1578844251758-2f71da64c96f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dGlyZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
    nama: 'Ban',
    kategori: _kategori[3],
    harga: 10000,
    stok: 200,
  ),
  BarangData(
    uriImage:
        'https://images.unsplash.com/photo-1571727153934-b9e0059b7ab2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8d2F0ZXIlMjBib3R0bGV8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
    nama: 'Botol Aqua',
    kategori: _kategori[1],
    harga: 1000,
    stok: 300,
  ),
  BarangData(
    uriImage:
        'https://images.unsplash.com/photo-1638307119060-d918b2d5e9ca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
    nama: 'Beling',
    kategori: _kategori[2],
    harga: 1000,
    stok: 400,
  ),
  BarangData(
    uriImage:
        'https://images.unsplash.com/photo-1592438944517-ee7d4fd058c9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    nama: 'Besi',
    kategori: _kategori[0],
    harga: 1000,
    stok: 500,
  ),
  BarangData(
    uriImage:
        'https://images.unsplash.com/photo-1592438944517-ee7d4fd058c9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    nama: 'Besi',
    kategori: _kategori[0],
    harga: 1000,
    stok: 600,
  ),
];
