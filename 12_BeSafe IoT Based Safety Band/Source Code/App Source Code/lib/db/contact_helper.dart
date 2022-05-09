import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String contactTable = "contactTable";
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String phoneColumn = "phoneColumn";

class ContactHelper {
  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper() => _instance;

  ContactHelper.internal();

  Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();

      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "contacts.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $contactTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $phoneColumn TEXT);");
    });
  }

  Future<Contact> saveContact(Contact contact) async {
    Database? dbContact = await db;

    contact.id = await dbContact!.insert(contactTable, contact.toMap());

    return contact;
  }

  Future<Contact?> getContact(int id) async {
    Database? dbContact = await db;

    List<Map> maps = await dbContact!.query(contactTable,
        columns: [idColumn, nameColumn, phoneColumn],
        where: "$idColumn = ?",
        whereArgs: [id]);

    if (maps.length > 0) {
      return Contact.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteContact(int id) async {
    Database? dbContact = await db;

    return await dbContact!
        .delete(contactTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateContact(Contact contact) async {
    Database? dbContact = await db;

    return await dbContact!.update(contactTable, contact.toMap(),
        where: "$idColumn = ?", whereArgs: [contact.id]);
  }

  Future<List> getAllContacts() async {
    Database? dbContact = await db;

    List listMap = await dbContact!.rawQuery("SELECT * FROM $contactTable");

    List<Contact> listContact = [];

    for (Map m in listMap) {
      listContact.add(Contact.fromMap(m));
    }

    return listContact;
  }

  Future<List> getContacts() async {
    Database? dbContact = await db;
    List phoneNumbers = [];
    List listMap =
        await dbContact!.rawQuery("SELECT phoneColumn FROM $contactTable");
    for (Map numbers in listMap) {
      phoneNumbers.add(numbers.values.toString());
    }
    return phoneNumbers;
  }

  getNumber() async {
    Database? dbContact = await db;

    return Sqflite.firstIntValue(
        await dbContact!.rawQuery("SELECT COUNT(*) FROM $contactTable"));
  }

  Future close() async {
    Database? dbContact = await db;

    dbContact!.close();
  }
}

class Contact {
  int? id;
  String? name;
  String? phone;

  Contact();

  Contact.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    phone = map[phoneColumn];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      phoneColumn: phone,
    };

    if (id != null) {
      map[idColumn] = id;
    }

    return map;
  }

  @override
  String toString() {
    return "Contact(id: $id, name: $name,phone: $phone)";
  }
}
