import 'package:nif_validator/nif_validator.dart';
import 'package:test/test.dart';

void main() {
  test('Garante a disponibilidade do servico SEPE', () async {
    final result = await NIFValidator().validate('00612109200045');

    expect(result, isA<NIFValidatorError>());
    expect((result as NIFValidatorError).code, isNot(1004));
  });

  // ! colocar nif valido para o test passar
  test('Verifica se o nif e valido', () async {
    final result = await NIFValidator().validate('00612109200045');

    expect(result.isValid, true);
    expect(result, isA<NIFValidatorResponse>());
    expect((result as NIFValidatorResponse).name, isA<String>());
    expect(result.name, isNotEmpty);
  });

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

  test('Confirma a indisponibilidade do servico', () async {
    final result = await NIFValidator().validate('00612109200045');

    expect((result as NIFValidatorError).code, 1004);
  });
}
