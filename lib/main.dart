import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String display = "0";
  String operacao = "";
  double? primeiroNumero;

  void pressionarBotao(String valor) {
    setState(() {
      if (valor == "C") {
        display = "0";
        operacao = "";
        primeiroNumero = null;
      } else if (valor == "+" || valor == "-" || valor == "×" || valor == "÷") {
        operacao = valor;
        primeiroNumero = double.tryParse(display);
        display = "0";
      } else if (valor == "=") {
        double segundoNumero = double.tryParse(display) ?? 0;
        double resultado = 0;

        switch (operacao) {
          case "+":
            resultado = (primeiroNumero ?? 0) + segundoNumero;
            break;
          case "-":
            resultado = (primeiroNumero ?? 0) - segundoNumero;
            break;
          case "×":
            resultado = (primeiroNumero ?? 0) * segundoNumero;
            break;
          case "÷":
            if (segundoNumero != 0) {
              resultado = (primeiroNumero ?? 0) / segundoNumero;
            } else {
              display = "Erro";
              return;
            }
            break;
        }

        display = resultado.toString();
        operacao = "";
        primeiroNumero = null;
      } else {
        // Números e ponto
        if (display == "0") {
          display = valor;
        } else {
          display += valor;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final botoes = [
      "C", "÷", "×", "←",
      "7", "8", "9", "-",
      "4", "5", "6", "+",
      "1", "2", "3", "=",
      "0", ".", "", ""
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              display,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Divider(color: Colors.white54),
          Expanded(
            child: GridView.builder(
              itemCount: botoes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                final valor = botoes[index];
                if (valor.isEmpty) return const SizedBox.shrink();

                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _corBotao(valor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => pressionarBotao(valor),
                    child: Text(
                      valor,
                      style: const TextStyle(fontSize: 26),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Color _corBotao(String valor) {
    if (valor == "C" || valor == "←") return Colors.redAccent;
    if (valor == "=") return Colors.green;
    if (["+", "-", "×", "÷"].contains(valor)) return Colors.blueGrey;
    return Colors.grey[850]!;
  }
}
