import 'package:hionepedia/data/model/animal_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'animal_favorites.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favorites(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR(100),
        desc TEXT,
        thumbnail_url TEXT,
        sound_url TEXT,
        model_url TEXT
      )
    ''');
  }

  Future<void> insertFavorite(AnimalModel favorite) async {
    final db = await database;
    await db.insert('favorites', favorite.toJson());
  }

  Future<List<AnimalModel>> getFavorites() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favorites');

    return List.generate(maps.length, (i) {
      return AnimalModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
        desc: maps[i]['desc'],
        thumbnailUrl: maps[i]['thumbnail_url'],
        soundUrl: maps[i]['sound_url'],
        modelUrl: "file://${maps[i]['model_url']}",
      );
    });
  }

  Future<void> deleteFavorite(int id) async {
    final db = await database;
    await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }
}
