import 'package:nif_validator/nif_validator.dart' as nif_validator;

void main(List<String> arguments) {
  print('${nif_validator.NIFValidator().validateBi('005181092BE045')}!');
}
