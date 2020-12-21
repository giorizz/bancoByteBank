import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  //TODO ASYNC AWAIT
  // final String dbPath = await getDatabasesPath();
  // final String path = join(dbPath, 'bytebank.db');
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(ContactDao.tableSQL);
  }, version: 2);
  // onDowngrade: onDatabaseDowngradeDelete);
}
//   return getDatabasesPath().then((dbPath) {
//     final String path = join(dbPath, 'bytebank.db');
//     return openDatabase(path, onCreate: (db, version) {
//       db.execute('CREATE TABLE contacts('
//           'id INTEGER PRIMARY KEY, '
//           'name TEXT, '
//           'account_number INTEGER)');
//     }, version: 2);
//     // onDowngrade: onDatabaseDowngradeDelete);
//   });
// }
