import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._();

  static final DB instance = DB._();

  static Database? _database;

  get database async {
    if (_database != null) {
      return _database;
    }
    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'reserva_livros.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_alunos);
    await db.execute(_livros);
    await db.execute(_generos);
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
  FOREIGN KEY (generoLivros) REFERENCES generos(nomeGenero),
  );
''';
  String get _generos => '''
  CREATE TABLE generos(
  idGeneros INTEGER PRIMARY KEY AUTOINCREMENT,
  nomeGenero TEXT
  );
''';
  Future createStudent(
      String studentName, int studentNumber, String studentEmail) async {
    final Database? db = await DB._database;
    await db?.insert(
        'alunos', {'nomeAlunos', studentName} as Map<String, Object?>);
    await db?.insert(
        'alunos', {'matriculaAlunos', studentNumber} as Map<String, Object?>);
    await db?.insert(
        'alunos', {'emailAlunos', studentEmail} as Map<String, Object?>);
    print("cadastrado com sucesso!");
  }
}
