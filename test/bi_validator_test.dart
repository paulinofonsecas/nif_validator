import 'package:nif_validator/nif_validator.dart';
import 'package:test/test.dart';

void main() {
  // test('Verifica se o nif e valido', () async {
  //   final result = await NIFValidator().validateBi('!!!!!!!');

  //   expect(result.isValid, true);
  //   expect(result, isA<NIFValidatorResponse>());
  //   expect((result as NIFValidatorResponse).name, isA<String>());
  //   expect(result.name, isNotEmpty);
  // });

  test('Retorna erro caso o BIF seja vazio', () async {
    final result = await NIFValidator().validate('');

    expect(result.isValid, false);
    expect(result, isA<NIFValidatorError>());
    expect((result as NIFValidatorError).code, 1001);
  });

  test('Retorna erro caso o BIF tenha menos ou mais de 14 digitos', () async {
    final result = await NIFValidator().validate('123');

    expect(result.isValid, false);
    expect(result, isA<NIFValidatorError>());
    expect((result as NIFValidatorError).code, 1002);
  });

  test('Retorna erro caso o BIF não seja valido ou inesistente', () async {
    final result = await NIFValidator().validate('00612109200045');

    expect(result.isValid, false);
    expect(result, isA<NIFValidatorError>());
    expect((result as NIFValidatorError).code, 1003);
  });
}
