// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class NIFValidatorResult {
  final bool isValid;

  NIFValidatorResult(this.isValid);
}

class NIFValidatorResponse extends NIFValidatorResult {
  NIFValidatorResponse({required this.nif, required this.name}) : super(true);

  final String nif;
  final String name;

  @override
  String toString() => 'NIFValidatorResponse(nif: $nif, name: $name)';
}

class NIFValidatorError extends NIFValidatorResult {
  NIFValidatorError({required this.code, required this.message}) : super(false);

  final int code;
  final String message;

  @override
  String toString() => 'NIFValidatorError(code: $code, message: $message)';
}
