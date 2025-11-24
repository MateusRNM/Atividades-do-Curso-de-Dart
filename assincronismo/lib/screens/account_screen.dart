import 'dart:io';

import 'package:assincronismo/models/accounts.dart';
import 'package:assincronismo/services/accountService.dart';
import 'package:http/http.dart';

class AccountScreen {

  final AccountService _accountService = AccountService();

  void initializeStream() {
    _accountService.streamInfos.listen((event) {
      print(event);
    });
  }

  void runChatBot() async {
    print("Bom dia! Eu sou o Lewis, assistente do Banco d'Ouro!");
    bool isRunning = true;


    _getAllAccounts() async {
      try {
        await _accountService.getAll();
      } on ClientException catch(error) {
        print("Não foi possível alcançar o servidor.");
        print("Tente novamente mais tarde.");
        print(error.message);
      } on Exception {
        print("Não foi possível recuperar os dados dos usuários.");
        print("Tente novamente mais tarde.");
      }
    }

    _addExampleAccount() async {
      Account example = Account(id: "ID01223", name: "Teste", lastName: "Conta", balance: 9000);
      try {
        await _accountService.addAccount(example);
      } on ClientException catch(error) {
        print("Não foi possível alcançar o servidor.");
        print("Tente novamente mais tarde.");
        print(error.message);
      } on Exception {
        print("Não foi possível adicionar uma conta.");
      }
    }


    while(isRunning) {
      print("Como posso te ajudar? (digite o número desejado)");
      print("1 - Ver todas as contas");
      print("2 - Adicionar nova conta");
      print("3 - sair");

      String? input = stdin.readLineSync();
      if(input != null) {
        switch(input) {
          case "1":
              {
                await _getAllAccounts();
                break;
              }
          case "2":
              {
                await _addExampleAccount();
                break;
              }
          case "3":
              {
                isRunning = false;
                print("Te vejo na próxima!");
                break;
              } 
          default:
              {
                print("Selecione uma opção válida!");
                break;
              }        
        }
      }
    }
  }
}