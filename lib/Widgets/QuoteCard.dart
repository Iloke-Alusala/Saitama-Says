import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:saitamasays/Services/Quotes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saitamasays/Colors/Colors.dart';
import 'package:share_plus/share_plus.dart';
import 'package:saitamasays/Database/Database.dart';

class QuoteCard extends StatefulWidget {
  QuoteCard({Key? key, required this.quote, required this.index})
      : super(key: key);
  final Quoter quote;
  final int index;

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  final colors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(3.0, 3, 3, 2),
      child: Container(
        decoration: BoxDecoration(
          color:colors
              .neonColours[widget.index % colors.neonColours.length] ,

          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            width: 1.5,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        width: 200,
        height: 160,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.35),
                    Colors.white.withOpacity(0.05)
                  ],
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  width: 1.5,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 10, 8, 2),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text('${widget.quote.character}',
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                    child: Text('${widget.quote.quote}',
                        style: GoogleFonts.judson(
                            color: Colors.black, fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              text: '~${widget.quote.anime}',
                              style: GoogleFonts.judson(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      PopupMenuButton(itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text('Share'),
                          onTap: (){
                            Share.share(
                                '"${widget.quote.quote}" - ${widget.quote.character}\n(${widget.quote.anime})');
                          },
                        ),
                        PopupMenuItem(
                            child: Text('Delete'),
                        onTap: (){
                          setState(() {
                            QuoteDatabase.instance.delete(widget.quote.id!);
                          });
                        },)
                      ])
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
