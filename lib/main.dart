import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rpl_ekajaya/constants/routes.dart';
import 'package:rpl_ekajaya/screens/daftar_transaksi_screen.dart';
import 'package:rpl_ekajaya/screens/login_screen.dart';
import 'package:rpl_ekajaya/screens/main_screen.dart';
import 'package:rpl_ekajaya/screens/register_screen.dart';
import 'package:rpl_ekajaya/screens/tambah_barang_screen.dart';
import 'package:rpl_ekajaya/screens/ubah_barang_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = GoogleFonts.robotoTextTheme(
      Theme.of(context).textTheme,
    );

    final _appBarTheme = AppBarTheme(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
      ),
      color: Colors.green[900],
      elevation: 0,
    );

    final _elevatedButtonTheme = ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(
            double.infinity,
            0,
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.green.shade900,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        textStyle: MaterialStateProperty.all(
          GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );

    final _textButtonTheme = TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.green.shade900,
            ),
          ),
        ),
      ),
    );

    InputDecorationTheme _inputDecorationTheme() {
      final _border = OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.green.shade900,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      );
      return InputDecorationTheme(
        enabledBorder: _border,
        border: _border,
        labelStyle: GoogleFonts.roboto(
          textStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        disabledBorder: _border,
      );
    }

    final _cardTheme = CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return MaterialApp(
      title: 'Recycle Shop',
      theme: ThemeData(
        appBarTheme: _appBarTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        textTheme: _textTheme,
        textButtonTheme: _textButtonTheme,
        inputDecorationTheme: _inputDecorationTheme(),
        cardColor: Colors.green.shade900,
        cardTheme: _cardTheme,
        primarySwatch: Colors.green,
      ),
      routes: {
        // rootRoute: (context) => const LoginScreen(),
        rootRoute: (context) => const MainScreen(isPenjual: true),
        registerRoute: (context) => const RegisterScreen(),
        mainPembeliRoute: (context) => const MainScreen(isPenjual: false),
        mainPenjualRoute: (context) => const MainScreen(isPenjual: true),
        daftarTransaksiRoute: (context) => const DaftarTransaksiScreen(),
        tambahBarangRoute: (context) => const TambahBarangScreen(),
      },
    );
  }
}
