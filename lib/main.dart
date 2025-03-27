import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculadoraPage(),
    );
  }
}

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  final TextEditingController _controller = TextEditingController();
  String _operacion = '';
  double _numero1 = 0;
  double _numero2 = 0;
  String _resultado = '';

  void _limpiar() {
    setState(() {
      _controller.clear();
      _operacion = '';
      _numero1 = 0;
      _numero2 = 0;
      _resultado = '';
    });
  }

  void _calcular() {
    setState(() {
      _numero2 = double.parse(_controller.text);
      switch (_operacion) {
        case '+':
          _resultado = (_numero1 + _numero2).toString();
          break;
        case '-':
          _resultado = (_numero1 - _numero2).toString();
          break;
        case '*':
          _resultado = (_numero1 * _numero2).toString();
          break;
        case '/':
          if (_numero2 != 0) {
            _resultado = (_numero1 / _numero2).toString();
          } else {
            _resultado = 'Error: División por cero';
          }
          break;
        default:
          _resultado = '';
      }
      _controller.clear();
    });
  }

  void _presionarNumero(String numero) {
    setState(() {
      if (_operacion.isEmpty) {
        _numero1 = double.parse(_controller.text + numero);
        _controller.text += numero;
      } else {
        _controller.text += numero;
      }
    });
  }

  void _presionarOperacion(String operacion) {
    setState(() {
      _operacion = operacion;
      _numero1 = double.parse(_controller.text);
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              readOnly: true,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 20),
            Text(
              _resultado.isEmpty ? '' : 'Resultado: $_resultado',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                childAspectRatio: 1.2,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => _presionarNumero('7'),
                    child: const Text('7'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => _presionarNumero('8'),
                    child: const Text('8'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => _presionarNumero('9'),
                    child: const Text('9'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => _presionarOperacion('/'),
                    child: const Text('/'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => _presionarNumero('4'),
                    child: const Text('4'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => _presionarNumero('5'),
                    child: const Text('5'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => _presionarNumero('6'),
                    child: const Text('6'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => _presionarOperacion('*'),
                    child: const Text('*'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => _presionarNumero('1'),
                    child: const Text('1'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => _presionarNumero('2'),
                    child: const Text('2'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => _presionarNumero('3'),
                    child: const Text('3'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => _presionarOperacion('-'),
                    child: const Text('-'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => _presionarNumero('0'),
                    child: const Text('0'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _limpiar,
                    child: const Text('C'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _calcular,
                    child: const Text('='),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => _presionarOperacion('+'),
                    child: const Text('+'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
