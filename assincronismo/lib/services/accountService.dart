import 'dart:async';
import 'package:assincronismo/models/accounts.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:assincronismo/api_key.dart';

class AccountService {
  static final StreamController<String> _streamController = StreamController<String>();
  static Stream<String> get streamInfos => _streamController.stream;
  static final String _url = "https://api.github.com/gists/d2998989b001b396bb9d4a4b7a9129eb";

  static Future<List<Account>> getAll() async {
    final Response request = await get(Uri.parse(_url), headers: {
      "Accept": "application/vnd.github+json",
      "Authorization": "Bearer $apiToken",
      "X-GitHub-Api-Version": "2022-11-28"
    });
    final content = json.decode(json.decode(request.body)["files"]["accounts.json"]["content"]);
    List<Account> listAccounts = [];
    for(dynamic dyn in content) {
      listAccounts.add(Account.fromMap(dyn as Map<String, dynamic>));
    }
    return listAccounts;
  }

  static addAccount(Account account) async {
    List<Account> accounts = await getAll();
    accounts.add(account);
    List<Map<String, dynamic>> listContent = [];
    for(Account acc in accounts) {
      listContent.add(acc.toMap());
    }
    final String content = json.encode(listContent);
    final response = await post(Uri.parse(_url), body: json.encode({
      "description": "accounts.json",
      "public": true,
      "files": {
        "accounts.json": {
          "content": content
        }
      }
    }), 
    headers: {
      "Accept": "application/vnd.github+json",
      "Authorization": "Bearer $apiToken",
      "X-GitHub-Api-Version": "2022-11-28"
    });
    if(response.statusCode.toString()[0] == '2') {
      _streamController.add("Conta de ${account.name} adicionada com sucesso!");
    } else {
      _streamController.add("Erro ao tentar adicionar a conta de ${account.name}.");
    }
  }

  static deleteAccount(Account account) async {
    List<Account> accounts = await getAll();
    accounts.removeWhere((obj) => obj == account);
    List<Map<String, dynamic>> listContent = [];
    for(Account acc in accounts) {
      listContent.add(acc.toMap());
    }
    final String content = json.encode(listContent);
    final response = await post(Uri.parse(_url), body: json.encode({
      "description": "accounts.json",
      "public": true,
      "files": {
        "accounts.json": {
          "content": content
        }
      }
    }), 
    headers: {
      "Accept": "application/vnd.github+json",
      "Authorization": "Bearer $apiToken",
      "X-GitHub-Api-Version": "2022-11-28"
    });
    if(response.statusCode.toString()[0] == '2') {
      _streamController.add("Conta de ${account.name} deletada com sucesso!");
    } else {
      _streamController.add("Erro ao tentar deletar a conta de ${account.name}.");
    }
  }

  static updateAccount(Account account) async {
    List<Account> accounts = await getAll();
    int index = accounts.indexWhere((obj) => obj.id == account.id);
    if(index != -1) {
      accounts[index] = accounts[index].copyWith(account.id, account.name, account.lastName, account.balance);
    } else {
      _streamController.add("Conta não existe.");
      return;
    }
    List<Map<String, dynamic>> listContent = [];
    for(Account? acc in accounts) {
      listContent.add(acc!.toMap());
    }
    final String content = json.encode(listContent);
    final response = await post(Uri.parse(_url), body: json.encode({
      "description": "accounts.json",
      "public": true,
      "files": {
        "accounts.json": {
          "content": content
        }
      }
    }), 
    headers: {
      "Accept": "application/vnd.github+json",
      "Authorization": "Bearer $apiToken",
      "X-GitHub-Api-Version": "2022-11-28"
    });
    if(response.statusCode.toString()[0] == '2') {
      _streamController.add("Conta de ${account.name} atualizada com sucesso!");
    } else {
      _streamController.add("Erro ao tentar atualizar a conta de ${account.name}.");
    }
  }

  static Future<Account?> getAccountById(String id) async {
    List<Account> accounts = await getAll();
    int index = accounts.indexWhere((acc) => acc.id == id);
    if(index == -1) {
      _streamController.add("Não foi encontrada uma conta de ID: $id");
      return null;
    }
    return accounts[index];
  }
}

