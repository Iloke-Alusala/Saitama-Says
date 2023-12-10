import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saitamasays/Colors/Colors.dart';
import 'package:saitamasays/Services/Quotes.dart';
import 'package:saitamasays/Database/Database.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:saitamasays/Widgets/QuoteCard.dart';
import 'package:saitamasays/Pages/ViewQuote.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/services.dart';

class SavedQuotes extends StatefulWidget {
  SavedQuotes({Key? key}) : super(key: key);

  @override
  State<SavedQuotes> createState() => _SavedQuotesState();
}

class _SavedQuotesState extends State<SavedQuotes> {
  static const colors = AppColors();

  List<Quoter> Quotes = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    refreshQuotes();
  }

  @override
  void dispose() {
    QuoteDatabase.instance.close();
    super.dispose();
  }

  Future refreshQuotes() async {
    setState(() => isLoading = true);
    this.Quotes = await QuoteDatabase.instance.readAllQuotes();
    this.Quotes = List.from(this.Quotes.reversed);
    setState(() => isLoading = false);
    //print('Refreshed');
  }

  @override
  Widget build(BuildContext context) {
    refreshQuotes();
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    title: Center(
                        child: Text('Saved Quotes',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ))),
                    toolbarHeight: 70,
                    shadowColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    flexibleSpace: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0)),
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: [
                            //Color(0xFF4EC183),
                            //Color(0xFF21D74E),
                            Color(0xFFE8E8E8),
                            Color(0xFFE8E8E8).withOpacity(0.5)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFFFFFFFF),
                  ],
                ),
              ),
              child: (Quotes.length > 0)
                  ? buildQuotes()
                  : Center(
                      child: Text('No Saved Quotes...',
                          style: GoogleFonts.montserrat(
                              fontSize: 24, fontWeight: FontWeight.w400)),
                    ),
            )));
  }

  Widget buildQuotes() {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(8),
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        final quote = Quotes[index];
        //print(Quotes.length);
        return GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              border: Border.all(
                width: 1.5,
                color: Colors.white.withOpacity(0.4),
              ),
            ),
            child: QuoteCard(quote: quote, index: int.parse(quote.position)),
          ),
          onTap: () async {
            await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => viewQuote(
                      quote: quote,
                    )));
          },
        );
      },
      itemCount: Quotes.length,
    );
  }
}
