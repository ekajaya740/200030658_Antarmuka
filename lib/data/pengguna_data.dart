class PenggunaData {
  PenggunaData({
    required this.nama,
    required this.email,
    required this.noTelp,
    required this.alamat,
    required this.username,
    required this.password,
    required this.isPenjual,
    required this.namaToko,
    required this.noRek,
    required this.foto,
  });

  String nama;
  String email;
  String noTelp;
  String alamat;
  String username;
  String password;
  bool isPenjual;
  String namaToko;
  String noRek;
  String foto;
}

List<PenggunaData> listPengguna = [
  PenggunaData(
    nama: 'Roxasium',
    email: 'roxasium@contact.io',
    noTelp: '0898888247725',
    alamat: 'Jalan Anggrek No 20',
    username: 'roxasium',
    password: 'stikomisthe1',
    isPenjual: false,
    foto:
        'https://images.unsplash.com/photo-1513956589380-bad6acb9b9d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHBvdHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60', namaToko: '', noRek: '',
  ),
  PenggunaData(
    nama: 'Andi',
    alamat: 'Jalan Mawar No 69',
    email: 'andi@gmail.com',
    isPenjual: false,
    noTelp: '083525235235',
    password: 'andi123',
    username: 'andiganteng',
    foto:
        'https://images.unsplash.com/photo-1586716402203-79219bede43c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80', namaToko: '', noRek: '',
  ),
  PenggunaData(
    nama: 'Budi',
    alamat: 'Jalan Anggrek No 69',
    email: 'budiyono666@gmail.com',
    isPenjual: true,
    noTelp: '0842125152151',
    password: 'budi1',
    username: 'budihanduk',
    namaToko: 'Toko Budi',
    noRek: '35253252523', foto: '',
  ),
  PenggunaData(
    nama: 'Celiboy',
    alamat: 'Jalan Batu No 69',
    email: 'celiboyae@gmail.com',
    isPenjual: false,
    noTelp: '08412512515',
    password: 'celuboy5',
    username: 'celiboyyy',
    foto:
        'https://images.unsplash.com/photo-1625595234473-c00c86c73353?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fHBvdHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60', namaToko: '', noRek: '',
  ),
  PenggunaData(
    nama: 'Dadang',
    alamat: 'Jalan Kapuk No 69',
    email: 'dadang@gmail.com',
    isPenjual: true,
    noTelp: '08151351331',
    password: 'dadadadang222',
    username: 'dadang88',
    namaToko: 'Toko Dadang',
    noRek: '10589135931319753', foto: '',
  ),
  PenggunaData(
    nama: 'Esa',
    alamat: 'Jalan Gunung Agung No 69',
    email: 'esasa@gmail.com',
    isPenjual: false,
    noTelp: '0831636136136',
    password: 'esaesa2',
    username: 'esa222', foto: '', namaToko: '', noRek: '',
  ),
  PenggunaData(
    nama: 'Fanny',
    alamat: 'Jalan Gatot Subroto No 69',
    email: 'fanny.darat@gmail.com',
    isPenjual: false,
    noTelp: '0895159159161',
    password: 'fannya5',
    username: 'fannya444',
    foto:
        'https://images.unsplash.com/photo-1619024370140-d625f2e354f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fHBvdHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60', namaToko: '', noRek: '',
  ),
];

PenggunaData? myData;
