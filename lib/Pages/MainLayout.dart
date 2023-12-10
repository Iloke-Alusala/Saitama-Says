import 'package:flutter/material.dart';
import 'package:saitamasays/Pages/GetQuotes.dart';
import 'package:saitamasays/Pages/SavedQuotes.dart';
import 'package:saitamasays/Colors/Colors.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key,
  required this.IntroQuoteInd}) : super(key: key);

  final int IntroQuoteInd;
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final _GetQuotes = GlobalKey<NavigatorState>();
  final _SavedQuotes = GlobalKey<NavigatorState>();
  final colors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Navigator(
              key: _GetQuotes,
              onGenerateRoute: (route) => MaterialPageRoute(
                    settings: route,
                    builder: (context) => GetQuotes(SQuoteIndex: widget.IntroQuoteInd),
                  )),
          Navigator(
              key: _SavedQuotes,
              onGenerateRoute: (route) => MaterialPageRoute(
                    settings: route,
                    builder: (context) => SavedQuotes(),
                  ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
            backgroundColor: Color(0xFFFCFCFC),
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
                ;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.cyan,
            unselectedItemColor: Colors.black,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, size: 30), label: 'Get Quotes',),
              BottomNavigationBarItem(
                  icon: Icon(Icons.save, size: 30), label: 'Saved Quotes'),
            ]),
      ),
    );
  }
}
