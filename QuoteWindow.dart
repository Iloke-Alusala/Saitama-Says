import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:saitamasays/Services/Quotes.dart';
import 'package:saitamasays/Colors/Colors.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteWindow extends StatefulWidget {
  final Quoter Quote;
  final int index;

  const QuoteWindow({Key? key, required this.Quote, required this.index})
      : super(key: key);

  @override
  State<QuoteWindow> createState() => _QuoteWindowState();
}

class _QuoteWindowState extends State<QuoteWindow> {
  static const colors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10, 0, 10),
      child: Container(
        decoration: BoxDecoration(
            color:
                colors.neonColours[(widget.index) % colors.neonColours.length],
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  offset: Offset(2, 2),
                  blurRadius: 5,
                  spreadRadius: 1),
              BoxShadow(
                  color: colors
                      .neonColours[(widget.index) % colors.neonColours.length]
                      .withOpacity(0.3),
                  offset: Offset(-1, -2),
                  blurRadius: 5,
                  spreadRadius: 1),
            ]),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0,12,10,2),
                child: Text(
                  'Anime: ${widget.Quote.anime}',
                  style: GoogleFonts.judson(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 8, 8, 2),
                child: Text(
                  'Character: ${widget.Quote.character}',
                  style: GoogleFonts.judson(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 12.0, 8.0, 4.0),
                child: Text('Quote: ',
                    style: GoogleFonts.judson(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    )),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 15, 16, 8),
                child: Container(
                  height: 150,
                  width: 800,
                  decoration: BoxDecoration(
                      color: Color(0xA6EFEEEE),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[400]!,
                            offset: Offset(4, 4),
                            blurRadius: 5,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4, -4),
                            blurRadius: 5,
                            spreadRadius: 1),
                      ]),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        widget.Quote.quote,
                        style: GoogleFonts.judson(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
