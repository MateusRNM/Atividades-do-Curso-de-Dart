import 'dart:io';

void main() {
  print("CALCULADORA:");
  String operation = "";
  while(!["+", "-", "/", "*"].contains(operation)){
    print("ESCOLHA UMA OPERAÇÃO: +, -, / ou *:");
    operation = stdin.readLineSync()!;
  }
  double? num1 = 0;
  double? num2 = 0;
  String? entrada;
  print("DIGITE O PRIMEIRO NÚMERO:");
  entrada = stdin.readLineSync();
  if(entrada != null && entrada != ""){
    num1 = double.tryParse(entrada);
    num1 = num1 ?? 0;
  }
  print("DIGITE O SEGUNDO NÚMERO:");
  entrada = stdin.readLineSync();
  if(entrada != null && entrada != ""){
    num2 = double.tryParse(entrada);
    num2 = num2 ?? 0;
  }
  double resultado;
  if(operation == "+"){
    resultado = num1 + num2;
  } else if(operation == "-"){
    resultado = num1 - num2;
  } else if(operation == "/"){
    resultado = num1/num2;
  } else {
    resultado = num1*num2;
  }
  print("$num1 $operation $num2 = $resultado");
}
