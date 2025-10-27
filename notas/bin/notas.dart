import 'dart:io';

List<String> notas = [];

void adicionarNota(){
  String? nota;
  print("Digite a nota que deseja adicionar (ou -1 para voltar ao menu):");
  nota = stdin.readLineSync();
  if(nota == null || nota.trim().isEmpty){
    print("");
    print("Nota inválida!");
    print("");
    adicionarNota();
    return;
  } else if (nota == "-1"){
    print("");
    return;
  }
  notas.add(nota);
  print("");
  print("A nota foi adicionada com sucesso! Número da nota: ${notas.length}");
  print("");
}

void removerNota(){
  String? entrada;
  int numero;
  listarNotas();
  print("Digite o número da nota que deseja remover (ou -1 para voltar ao menu):");
  entrada = stdin.readLineSync();
  numero = int.tryParse(entrada ?? "") ?? -2;
  if(numero != -1 && (numero < 1 || numero > notas.length)){
    print("");
    print("Número inválido!");
    print("");
    removerNota();
    return;
  } else if(numero == -1){
    print("");
    return;
  }
  notas.removeAt(numero-1);
  print("");
  print("Nota de número $numero foi removida com sucesso!");
  print("");
}

void listarNotas(){
  print("  _    ___ ___ _____ _     ___  ___   _  _  ___ _____ _   ___ _ ");
  print(" | |  |_ _/ __|_   _/_\\   |   \\| __| | \\| |/ _ \\_   _/_\\ / __(_)");
  print(" | |__ | |\\__ \\ | |/ _ \\  | |) | _|  | .\` | (_) || |/ _ \\\\__ \\_ ");
  print(" |____|___|___/ |_/_/ \\_\\ |___/|___| |_|\\_|\\___/ |_/_/ \\_\\___(_)");
  print("                                                                ");
  for(int i = 0; i < notas.length; i++){
    print("${i+1} - ${notas[i]}");
  }
  print("");
}

void main() {
  String? entrada;
  print("");
  while(true){
    print("  __  __ ___ _  _ _   _ _ ");
    print(" |  \\/  | __| \\| | | | (_)");
    print(" | |\\/| | _|| .\` | |_| |_ ");
    print(" |_|  |_|___|_|\\_|\\___/(_)");
    print("                          ");
    print("Escolha a opção:");
    print(" - 0: Adicionar uma nota.");
    print(" - 1: Listar todas as notas.");
    print(" - 2: Remover uma nota.");
    print(" - 3: Sair do aplicativo.");
    entrada = stdin.readLineSync();
    while(!["0", "1", "2", "3"].contains(entrada)){
      print("Opção inválida! digite uma opção válida:");
      entrada = stdin.readLineSync();
    }
    if(entrada == "0"){
      print("");
      adicionarNota();
    } else if(entrada == "1"){
      print("");
      listarNotas();
    } else if(entrada == "2"){
      print("");
      removerNota();
    } else {
      break;
    }
  } 
}
