import 'package:crud_agenda/app/domain/entities/contact.dart';
import 'package:crud_agenda/app/domain/exception/domain_layer_exception.dart';
import 'package:crud_agenda/app/domain/interfaces/contact_dao.dart';
import 'package:get_it/get_it.dart';

class ContactService {
  var _dao = GetIt.I.get<ContactDAO>();

  save(Contact contact) {
    validateName(contact.nome);
    validateEmail(contact.email);
    validatePhone(contact.telefone);
    _dao.save(contact);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<Contact>> find() {
    return _dao.find();
  }

  validateName(String name) {
    var min = 3;
    var max = 50;

    if (name == null) {
      throw new DomainLayerException('O nome é obrigatório.');
    } else if (name.length < min) {
      throw new DomainLayerException(
          'O nome deve possuir pelo menos $min caracteres.');
    } else if (name.length > max) {
      throw new DomainLayerException(
          'O nome deve possuir no máximo $max caracteres.');
    }
  }

  validateEmail(String email) {
    if (email == null) {
      throw new DomainLayerException('O e-mail é obrigatório.');
    } else if (!email.contains('@')) {
      throw new DomainLayerException('O e-mail deve possuir @.');
    }
  }

  validatePhone(String phone) {
    var format = RegExp(r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$');
    if (phone == null) {
      throw new DomainLayerException('O telefone é obrigatório.');
    } else if (!format.hasMatch(phone)) {
      throw new DomainLayerException('Formato inválido.');
    }
  }
}
