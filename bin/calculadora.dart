import 'dart:io';

void main() {
  print('=== Calculadora Interativa ===');

  while (true) {
    print('\nDigite a expressão (ex: 3 + 5) ou "sair" para encerrar:');
    String? entrada = stdin.readLineSync();

    if (entrada == null) {
      print('❌ Entrada inválida!');
      continue;
    }

    if (entrada.toLowerCase() == 'sair') {
      print('Saindo da calculadora...');
      break;
    }

    // Separar números e operador usando espaço
    List<String> partes = entrada.split(' ');
    if (partes.length != 3) {
      print('❌ Formato inválido! Use: número operador número (ex: 3 + 5)');
      continue;
    }

    double? num1 = double.tryParse(partes[0]);
    String operador = partes[1];
    double? num2 = double.tryParse(partes[2]);

    if (num1 == null || num2 == null) {
      print('❌ Número inválido!');
      continue;
    }

    double resultado;

    switch (operador) {
      case '+':
        resultado = num1 + num2;
        print('Resultado: $resultado');
        break;
      case '-':
        resultado = num1 - num2;
        print('Resultado: $resultado');
        break;
      case '*':
        resultado = num1 * num2;
        print('Resultado: $resultado');
        break;
      case '/':
        if (num2 == 0) {
          print('❌ Erro: Divisão por zero!');
        } else {
          resultado = num1 / num2;
          print('Resultado: $resultado');
        }
        break;
      default:
        print('❌ Operador inválido! Use +, -, * ou /');
    }
  }
}
