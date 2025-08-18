import 'dart:io';

void main() {
  print('=== Calculadora Interativa ===');

  while (true) {
    print('\nEscolha a operação:');
    print('1 - Adição (+)');
    print('2 - Subtração (-)');
    print('3 - Multiplicação (*)');
    print('4 - Divisão (/)');
    print('0 - Sair');

    String? escolha = stdin.readLineSync();

    // Valida se a escolha é nula ou não está entre 0 e 4
    if (escolha == null || !['0', '1', '2', '3', '4'].contains(escolha)) {
      print('❌ Entrada inválida! Digite apenas 0, 1, 2, 3 ou 4.');
      continue; // volta para o menu
    }

    if (escolha == '0') {
      print('Saindo da calculadora...');
      break;
    }

    // Solicita os números
    print('Digite o primeiro número:');
    double? num1 = double.tryParse(stdin.readLineSync()!);
    if (num1 == null) {
      print('❌ Número inválido!');
      continue;
    }

    print('Digite o segundo número:');
    double? num2 = double.tryParse(stdin.readLineSync()!);
    if (num2 == null) {
      print('❌ Número inválido!');
      continue;
    }

    double resultado;

    switch (escolha) {
      case '1':
        resultado = num1 + num2;
        print('Resultado: $resultado');
        break;
      case '2':
        resultado = num1 - num2;
        print('Resultado: $resultado');
        break;
      case '3':
        resultado = num1 * num2;
        print('Resultado: $resultado');
        break;
      case '4':
        if (num2 == 0) {
          print('❌ Erro: Divisão por zero!');
        } else {
          resultado = num1 / num2;
          print('Resultado: $resultado');
        }
        break;
    }
  }
}
