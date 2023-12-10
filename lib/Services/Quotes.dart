import 'dart:convert';
import 'package:http/http.dart';

final String tableQuote = 'Quotes';

class QuoteFields {
  static final List<String> values = [
    /// Add all fields
    id, anime, character, quote, favourite, position
  ];

  static final String id = '_id';
  static final String anime = 'anime';
  static final String character = 'character';
  static final String quote = 'quote';
  static final String favourite = 'favourite';
  static final String position = 'position';
}

class Quoter {
  int? id;

  String anime = '';
  String character = '';
  String quote = '';
  bool favourite = false;
  bool? saved = false;
  String position = '';

  Quoter(
      {required this.anime,
      required this.character,
      required this.quote,
      required this.favourite,
      this.id,
      this.saved,
      required this.position});

  Future<void> GetRandomQuote() async {
    try {
      Response response =
          await get(Uri.https('animechan.vercel.app', '/api/random'));
      Map data = jsonDecode(response.body);
      anime = data['anime'];
      character = data['character'];
      quote = data['quote'];
      quote = StringFix(quote);
      print(quote);
      favourite = false;
      id = 0;
      saved = false;
    } catch (e) {
      print('Could not connect to Servers');
      quote =
          'Oops, please connect to the internet. \n\nRemmeber only 100 quotes per hour';
    }
  }

  Quoter copy({
    int? id,
    String? anime,
    String? character,
    String? quote,
    bool? favourite,
    String? position,
  }) =>
      Quoter(
          id: id ?? this.id,
          anime: anime ?? this.anime,
          character: character ?? this.character,
          quote: quote ?? this.quote,
          favourite: favourite ?? this.favourite,
          position: position ?? this.position);

  static Quoter fromJson(Map<String, Object?> json) => Quoter(
        id: json[QuoteFields.id] as int?,
        anime: json[QuoteFields.anime] as String,
        character: json[QuoteFields.character] as String,
        quote: json[QuoteFields.quote] as String,
        favourite: json[QuoteFields.favourite] == 1,
        position: json[QuoteFields.position] as String,
      );

  Map<String, Object?> toJson() => {
        QuoteFields.id: id,
        QuoteFields.favourite: favourite ? 1 : 0,
        QuoteFields.quote: quote,
        QuoteFields.character: character,
        QuoteFields.anime: anime,
        QuoteFields.position: position,
      };

  String StringFix(String str) {
    String tmp = '';
    for (int i = 0; i < str.length; ++i) {
      if (str[i] == '"') {
        tmp += "''";
      } else {
        tmp += str[i];
      }
    }
    return tmp;
  }
}
