import 'dart:ffi';

import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:saitamasays/Services/Quotes.dart';

class QuoteDatabase {
  static final QuoteDatabase instance = QuoteDatabase._init();

  static Database? _database;

  QuoteDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('Quotes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableQuote ( 
  ${QuoteFields.id} $idType, 
  ${QuoteFields.anime} $textType,
  ${QuoteFields.character} $textType,
  ${QuoteFields.quote} $textType,
  ${QuoteFields.favourite} $boolType,
  ${QuoteFields.position} $textType
  )
''');
  }

  Future<Quoter> create(Quoter quote) async {
    final db = await instance.database;
    //print('In Check');
    bool allow = await QuoteInDb(quote);
    //print(allow);
    if (!allow) {
      /*
      yourlist.clear()
      yourlist
          .addAll(mapList.map((e) => yourmodel.fromJson(e)).toList());
       */
      //print('Added to Db');
      final id = await db.rawInsert('INSERT INTO $tableQuote('
          '${QuoteFields.favourite}, ${QuoteFields.quote}, ${QuoteFields.character},'
          '${QuoteFields.anime},${QuoteFields.id},${QuoteFields.position}) VALUES(?, ?, ?, ?, ?, ?)',
      [quote.favourite,'${quote.quote}', quote.character,quote.anime,quote.id,
      quote.position]);
      return quote.copy(id: id);

    }
    return quote.copy();
  }

  Future<bool> QuoteInDb(Quoter check) async {
    //returns true if Quote in database
    final db = await instance.database;
    List<Map<String, dynamic>> mapList = [];
    mapList = await getQuoteDetail(
        table: tableQuote, where: '${QuoteFields.quote}= "${check.quote}"');
    print('Map is $mapList');
    return mapList.isNotEmpty;
  }

  static Future<List<Map<String, dynamic>>> getQuoteDetail(
      {required String table,
        String? query,
        String? orderBy,
        String? where,
        int? limit}) async {
    final db = await instance.database;
    return db.query(table, orderBy: orderBy, limit: limit, where: where);
  }

  Future<Quoter> readQuote(int id)async{
    final db = await instance.database;

    final maps = await db.query(
      tableQuote,
      columns: QuoteFields.values,
      //values in 'whereArgs' stand in place of '?'
      //This syntax prevents SQL injections
      where: '${QuoteFields.id} = ?',
      whereArgs: [id],
    );

    if(maps.isNotEmpty){
      return Quoter.fromJson(maps.first);
    }
    else{
      throw Exception('Id $id could not be found :/');
    }
  }

  Future<List<Quoter>> readAllQuotes() async {
    final db = await instance.database;

    final orderBy = '${QuoteFields.id} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableQuote, orderBy: orderBy);

    return result.map((json) => Quoter.fromJson(json)).toList();
  }

  Future<int> update(Quoter quote) async{
    final db = await instance.database;

    return db.update(
      tableQuote,
      quote.toJson(),
      where: '${QuoteFields.id} = ?',
      whereArgs: [quote.id],
    );
  }

  Future<int> delete(int id) async{
    final db = await instance.database;
    return await db.delete(
        tableQuote,
        where: '${QuoteFields.id} = ?',
        whereArgs: [id]
    );
  }
  Future close() async{
    final db = await instance.database;
    db.close();
  }
}