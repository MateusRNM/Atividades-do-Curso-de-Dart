import 'dart:io';

void main() {
  print("CALCULADORA:");
  String operation = "";
  while(!["+", "-", "/", "*"].contains(operation)){
    print("ESCOLHA UMA OPERAÇÃO: +, -, / ou *:");
    operation = stdin.readLineSync()!;
  }
  double num1, num2;
  print("DIGITE O PRIMEIRO NÚMERO:");
  num1 = double.parse(stdin.readLineSync()!);
  print("DIGITE O SEGUNDO NÚMERO:");
  num2 = double.parse(stdin.readLineSync()!);
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
