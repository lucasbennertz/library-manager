import 'package:reserva_livros/models/book_model.dart';
import 'package:reserva_livros/models/gender_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._();

  static final DB instance = DB._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    return await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'reserva_livros.db'),
      version: 1,
      onCreate: _onCreate,
    );
    return _database!;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(_alunos);
    await db.execute(_livros);
    await db.execute(_generos);

    // Insere gêneros padrão
    await db.insert('generos', {'nomeGenero': "Ação"});
    await db.insert('generos', {'nomeGenero': "Suspense"});
    await db.insert('generos', {'nomeGenero': "Romance"});
    await db.insert('generos', {'nomeGenero': "Crônica"});
    await db.insert('generos', {'nomeGenero': "Reportagem"});
    await db.insert('generos', {'nomeGenero': "Comédia"});
  }

  String get _alunos => '''
  CREATE TABLE alunos (
    idAlunos INTEGER PRIMARY KEY AUTOINCREMENT,
    nomeAlunos TEXT,
    matriculaAlunos INTEGER,
    emailAlunos TEXT
  );
  ''';

  String get _livros => '''
  CREATE TABLE livros (
    idLivros INTEGER PRIMARY KEY AUTOINCREMENT,
    tituloLivros TEXT,
    autorLivros TEXT,
    generoLivros INTEGER,
    disponibilidadeLivros INTEGER,
    FOREIGN KEY (generoLivros) REFERENCES generos(idGeneros)
  );
  ''';

  String get _generos => '''
  CREATE TABLE generos (
    idGeneros INTEGER PRIMARY KEY AUTOINCREMENT,
    nomeGenero TEXT
  );
  ''';

  Future<void> createStudent(
      String studentName, int studentNumber, String studentEmail) async {
    final Database db = await database;
    await db.insert('alunos', {
      'nomeAlunos': studentName,
      'matriculaAlunos': studentNumber,
      'emailAlunos': studentEmail,
    });
    print("Estudante cadastrado com sucesso!");
  }

  Future<List<GenderModel>> getGenders() async {
    final Database db = await database; // Corrigido para usar o getter
    final List<Map<String, dynamic>> maps = await db.query('generos');
    return List.generate(maps.length, (i) {
      return GenderModel.fromMap(maps[i]);
    });
  }

  Future<List<BookModel>> getBooks() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('livros');
    return List.generate(maps.length, (i) {
      return BookModel.fromMap(maps[i]);
    });
  }

  Future<void> createBook(String bookTitle, String bookWriter, int? bookGender,
      int? bookDisponibility) async {
    final Database db = await database;
    await db.insert('livros', {
      'tituloLivros': bookTitle,
      'autorLivros': bookWriter,
      'generoLivros': bookGender,
      'disponibilidadeLivros': bookDisponibility,
    });
    print("Livro cadastrado com sucesso!");
  }
}
