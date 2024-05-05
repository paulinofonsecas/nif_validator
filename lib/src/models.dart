// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class NIFValidatorResult {}

class NIFValidatorResponse extends NIFValidatorResult {
  NIFValidatorResponse({required this.nif, required this.name});

  final String nif;
  final String name;

  @override
  String toString() => 'NIFValidatorResponse(nif: $nif, name: $name)';
}

class NIFValidatorError extends NIFValidatorResult {
  NIFValidatorError({required this.code, required this.message});

  final int code;
  final String message;

  @override
  String toString() => 'NIFValidatorError(code: $code, message: $message)';
}
