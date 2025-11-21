import 'dart:io';

import 'package:assincronismo/models/accounts.dart';
import 'package:assincronismo/services/accountService.dart';

class AccountScreen {

  void initializeStream() {
    AccountService.streamInfos.listen((event) {
      print(event);
    });
  }

  void runChatBot() async {
    print("Bom dia! Eu sou o Lewis, assistente do Banco d'Ouro!");
    bool isRunning = true;


    void getAllAccounts() async {
      List<Account> listAccounts = await AccountService.getAll();
      print(listAccounts);
    }

    void addExampleAccount() async {
      Account example = Account(id: "ID01223", name: "Teste", lastName: "Conta", balance: 9000);
      AccountService.addAccount(example);
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
                getAllAccounts();
                break;
              }
          case "2":
              {
                addExampleAccount();
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