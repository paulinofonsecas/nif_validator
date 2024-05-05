## Pacote Dart para Validação de NIF via Endpoint 

**Introdução**

Este pacote Dart fornece uma ferramenta para validar NIFs (Número de Identificação Fiscal) em Angola através do endpoint do SEPE. O pacote facilita a verificação da autenticidade e validade de NIFs para diversos casos de uso, como cadastro de clientes, verificação de identidade em transações financeiras e muito mais.

**Instalação**

Para instalar o pacote, adicione a seguinte dependência ao seu arquivo `pubspec.yaml`:

```yaml
dependencies:
  nif_validator: ^latest_version
```

Substitua `latest_version` pela versão mais recente do pacote disponível no pub.dev.

**Uso**

O pacote fornece uma classe principal, `NIFValidator`, que pode ser utilizada para validar NIFs. Para validar um NIF, siga estas etapas:

1. Importe o pacote:

```dart
import 'package:nif_validator/nif_validator.dart';
```

2. Crie uma instância da classe `NifValidator`:

```dart
final validator = NifValidator();
```

3. Chame o método `validate` da instância, passando o NIF a ser validado como argumento:

```dart
final result = validator.validate('123456789AA001');
```

O método `validate` retorna um objeto `ValidationResult` que contém as seguintes informações:

* `isValid`: Indica se o NIF é válido ou não.
* `errorMessage`: Uma mensagem de erro em caso de NIF inválido.

**Exemplo de Uso**

```dart
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
```
**Contribuição**

O pacote é de código aberto e você é bem-vindo a contribuir com sugestões, correções de bugs ou novos recursos.
