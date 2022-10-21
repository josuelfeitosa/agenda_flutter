import 'package:crud_agenda/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:crud_agenda/app/domain/interfaces/contact_dao.dart';
import 'package:get_it/get_it.dart';

setupInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ContactDAO>(ContactDAOImpl());
}
