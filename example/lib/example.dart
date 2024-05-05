import 'package:nif_validator/nif_validator.dart';

void main() async {
  final validator = NIFValidator();

  final nif = '005489315Be041';
  final result = await validator.validate(nif);

  if (result.isValid) {
    print('NIF $nif é válido.');
    print('Nome: ${(result as NIFValidatorResponse).name}.');
  } else {
    print('NIF $nif é inválido: ${(result as NIFValidatorError).message}');
  }
}