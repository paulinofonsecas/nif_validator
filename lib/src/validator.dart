import 'package:nif_validator/src/models.dart';
import 'package:dio/dio.dart';

const _sepeNIFValidatorUrl =
    'https://sepe.gov.ao/ao/actions/nif.ajcall.php?nif=';

class NIFValidator {
  final Dio _dio;

  NIFValidator({Dio? dio}) : _dio = dio ?? Dio();

  /// Validates a given NIF number.
  ///
  /// The function takes a [nif] parameter which represents the NIF number to be validated.
  /// It returns a [Future] that resolves to a [NIFValidatorResult].
  ///
  /// If the [nif] is empty, it returns a [NIFValidatorError] with code 1001 and the message "O NIF não pode ser vazio.".
  /// If the length of the [nif] is not 14, it returns a [NIFValidatorError] with code 1002 and the message "O NIF deve ter 14 digitos.".
  ///
  /// If the validation is successful, it makes a POST request to the SEPE NIF Validator API using the [Dio] library.
  /// It checks the response data for the 'success' or 'sucess' key.
  /// If the key is present and its value is truthy, it returns a [NIFValidatorResponse] with the extracted 'numero' and 'nome' values.
  /// If the key is not present or its value is falsy, it returns a [NIFValidatorError] with code 1003 and the message "Não existe nenhuma informação acerca do NIF informado!".
  ///
  /// If an exception occurs during the validation process, it returns a [NIFValidatorError] with code 1004 and the message "Ocorreu um erro inesperado ao validar o NIF".
  Future<NIFValidatorResult> validate(String nif) async {
    if (nif.isEmpty) {
      return NIFValidatorError(
        code: 1001,
        message: 'O NIF não pode ser vazio.',
      );
    }

    if (nif.length != 14) {
      return NIFValidatorError(
        code: 1002,
        message: 'O NIF deve ter 14 digitos.',
      );
    }

    try {
      final result = await _dio.post(_sepeNIFValidatorUrl + nif);
      final isSuccess = result.data['sucess'] ?? result.data['success'];

      if (isSuccess) {
        return NIFValidatorResponse(
          nif: result.data['data']['numero'].toString(),
          name: result.data['data']['nome'],
        );
      } else {
        if (result.data['message'] ==
            'Serviço de consulta temporariamente '
                'indisponível, por favor tente mais tarde.') {
          return NIFValidatorError(
            code: 1004,
            message: 'Não existe nenhuma informação acerca do NIF informado!',
          );
        }
        return NIFValidatorError(
          code: 1003,
          message: 'Não existe nenhuma informação acerca do NIF informado!',
        );
      }
    } catch (e) {
      return NIFValidatorError(
        code: 1004,
        message: 'Ocorreu um erro inesperado ao validar o NIF',
      );
    }
  }
}
