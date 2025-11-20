import 'package:banco/banco.dart';

void main() {
  ContaCorrente contaMateus = ContaCorrente("Mateus", 2520); 
  ContaPoupanca contaChris = ContaPoupanca("Chris", 3456);
  ContaEmpresa contaDiego = ContaEmpresa("Diego", 4000);
  ContaInvestimento contaLaura = ContaInvestimento("Laura", 5600);

  contaDiego.receber(1000);
  contaLaura.enviar(1000);
  contaMateus.enviar(2820);
  contaChris.calculaRendimento();
}
