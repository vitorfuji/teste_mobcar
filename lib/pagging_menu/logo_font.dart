import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoFont extends StatelessWidget {
  const LogoFont({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'MOBCAR',
      textAlign: TextAlign.left,
      style: GoogleFonts.poppins(
        color: const Color.fromRGBO(0, 151, 208, 1),
        fontSize: 12.0,
      ),
    );
  }
}
