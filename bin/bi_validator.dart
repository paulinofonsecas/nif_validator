import 'dart:io';

import 'package:nif_validator/nif_validator.dart';

void main(List<String> arguments) async {
  try {
    final String? nif = arguments.isNotEmpty ? arguments.first : null;

    if (nif == null) {
      print('Nif invalido');
      exit(-1);
    }

    final result = await NIFValidator().validate(nif);

    print('Resultado: ${result.isValid ? 'Valido' : 'Invalido'}');
    if (result is NIFValidatorResponse) {
      print('Nome: ${result.name}');
    } else if (result is NIFValidatorError) {
      print('Error: ${result.message}');
    }
  } catch (e) {
    print(e.toString());
  }
}
