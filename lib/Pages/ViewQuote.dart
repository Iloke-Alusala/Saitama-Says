import 'package:flutter/material.dart';
import 'package:saitamasays/Services/Quotes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:saitamasays/Colors/Colors.dart';
import 'package:flutter/services.dart';

class viewQuote extends StatefulWidget {
  const viewQuote({Key? key, required this.quote}) : super(key: key);
  final Quoter quote;

  @override
  State<viewQuote> createState() => _viewQuoteState();
}

class _viewQuoteState extends State<viewQuote> {
  final colors = AppColors();

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    //print((int.parse(widget.quote.position) * 2) % colors.neonColours.length);
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: widget.quote.anime,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        toolbarHeight: 80,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                //Color(0xFF4EC183),
                //Color(0xFF21D74E),
                Colors.white
                    .withOpacity(0.7),
                Colors.white
              ],
            ),
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black, size: 25),
        bottom: PreferredSize(
            child: Container(
              color: Colors.grey.withOpacity(0.15),
              height: 3,
            ),
            preferredSize: Size.fromHeight(2)),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
            colors.neonColours[int.parse(widget.quote.position) % colors.neonColours.length]
                .withOpacity(0.7),
            Colors.white
            ],
            stops: [
              0.72,
              1
            ]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: RichText(
                text: TextSpan(
                    children: [TextSpan(text: '${widget.quote.quote}\n\n',
                      style: GoogleFonts.judson(
                          color: Colors.black, fontSize: 21, height: 1.5),),
                      TextSpan(text: '~${widget.quote.character}',
                          style: GoogleFonts.judson(
                            color: Colors.black, fontSize: 21, height: 1.5,))
                    ]
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 50,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    ),);
  }
}
