import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saitamasays/Widgets/QuoteWindow.dart';
import 'package:saitamasays/Services/Quotes.dart';
import 'package:saitamasays/Colors/Colors.dart';
import 'package:saitamasays/Database/Database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saitamasays/SaitamaPhrases/SaitamaPhrases.dart';
import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';

class GetQuotes extends StatefulWidget {
  GetQuotes({Key? key, required this.SQuoteIndex}) : super(key: key);
  final int SQuoteIndex;

  @override
  State<GetQuotes> createState() => _GetQuotesState();
}

class _GetQuotesState extends State<GetQuotes> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  String title = 'Saitama Says...';

  //Quoter Quote = Quoter(anime: '', character: '', quote: '', favourite: false);
  int _index = 0;
  int quoteCount = 0;
  var rand = Random();
  List<Quoter> Quotes = [];
  static const colors = AppColors();
  static const phrases = SaitamaLines();
  bool connected = true;
  final controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          flexibleSpace: SizedBox(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10, 8, 0),
              child: SafeArea(
                child: Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          'Assets/Saitama.png',
                        ),
                        radius: 50,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            text: phrases.lines[widget.SQuoteIndex],
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                          maxLines: 4,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: SizedBox(
                      height: 330, // Card Height
                      child: (Quotes.length > 0)
                          ? /*PageView.builder(
                              controller: PageController(
                                viewportFraction: 0.8888,
                              ),
                              itemCount: Quotes.length,
                              onPageChanged: (int index) => setState(() {
                                    _index = index;
                                    //quoteAdded = QuoteDatabase.instance.QuoteInDb(Quotes[_index]);
                                  }),
                              itemBuilder: (BuildContext context, int i) {
                                return Transform.scale(
                                  scale: i == _index ? 1 : 0.9,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(1, 8, 4, 1),
                                    child: QuoteWindow(
                                        Quote: Quotes[i],
                                        index: int.parse(Quotes[i].position)),
                                  ),
                                );
                              })
                              */
                          CarouselSlider.builder(
                              itemCount: Quotes.length,
                              itemBuilder: (context, index, realIndex) {
                                return QuoteWindow(
                                    Quote: Quotes[index],
                                    index: int.parse(Quotes[index].position));
                              },
                              carouselController: controller,
                              options: CarouselOptions(
                                  height: 330,
                                  viewportFraction: 0.888888,
                                  enlargeCenterPage: true,
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.scale,
                                  enableInfiniteScroll: false,
                                  onPageChanged: (index, reason) {
                                    _index = index;
                                  }),
                            )
                          : Center(
                              child: Text('No Quotes',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400)),
                            ),
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.black),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      height: 40,
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.update, color: Colors.black),
                        label: Text('Random Quote',
                            style: GoogleFonts.montserrat(
                                fontSize: 15, color: Colors.black)),
                        onPressed: () async {
                          Quoter newQuote = await Quoter(
                              anime: '',
                              character: '',
                              quote: '',
                              favourite: false,
                              position: rand
                                  .nextInt(colors.neonColours.length)
                                  .toString(),
                              saved: false);
                          await newQuote.GetRandomQuote();
                          if (newQuote.anime == '') {
                            connected = false;
                          } else {
                            connected = true;
                          }
                          setState(() {
                            if (connected) {
                              Quotes.add(newQuote);
                            } else {
                              _showMyDialog();
                            }
                          });
                          NextQuote();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          primary: colors.C1,
                          shadowColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 27.4,
                  ),
                  Container(
                    height: 40,
                    width: 200,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.save_alt, color: Colors.black),
                      label: Text(
                        'Save Quote',
                        style: GoogleFonts.firaSans(
                            fontSize: 15, color: Colors.black),
                      ),
                      onPressed: () async {
                        await addQuote();
                        setState(() {
                          print('Saved is: ${Quotes[_index].saved}');
                          if (Quotes[_index].saved == false) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'Saved',
                                style: TextStyle(
                                    fontSize: 20,
                                    height: 1.8,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              duration: Duration(milliseconds: 700),
                              dismissDirection: DismissDirection.startToEnd,
                              // Width of the SnackBar.
                              padding: const EdgeInsets.symmetric(
                                horizontal:
                                    8.0, // Inner padding for SnackBar content.
                              ),
                            ));
                            Quotes[_index].saved = true;
                          } else {
                            return null;
                          }
                          //print(Quotes[_index].saved);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          primary: colors.C1,
                          shadowColor: Colors.black,
                          elevation: 5),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> LoadQuote(Quoter quote) async {
    await quote.GetRandomQuote();
  }

  Future addQuote() async {
    final quote = Quoter(
      quote: Quotes[_index].quote,
      anime: Quotes[_index].anime,
      character: Quotes[_index].character,
      favourite: Quotes[_index].favourite,
      position: Quotes[_index].position,
      saved: true,
    );
    await QuoteDatabase.instance.create(quote);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Oops, something's wrong...",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          content: SingleChildScrollView(
            child: Text(
                'Please connect to the internet. \n\nRemmeber only 100 quotes per hour',
                style: TextStyle(fontSize: 18)),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void NextQuote() {
    controller.animateToPage(Quotes.length,
        duration: Duration(milliseconds: 700), curve: Curves.easeInQuad);
  }
}
