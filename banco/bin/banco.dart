import 'package:banco/banco.dart';

void main() {
  ContaCorrente contaMateus = ContaCorrente("Mateus", 2520);
  ContaPoupanca contaChris = ContaPoupanca("Chris", 3456);

  contaMateus.enviar(2820);
  contaChris.calculaRendimento();
}
