import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'GUI/home_screen.dart';
void main(){
  runApp(ClupHouse());
}
class ClupHouse  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Clup House Ui",
      theme: ThemeData(appBarTheme: const AppBarTheme(backgroundColor:Colors.blueGrey,),
          scaffoldBackgroundColor: Colors.white70,
        primaryColor: Colors.white,
        accentColor: Colors.teal[500],
        iconTheme: const IconThemeData(color: Colors.black),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: GoogleFonts.montserratTextTheme()
      ),
      home: const Scaffold(


        body: HomeScreen(),
      ),
    );
  }
}
