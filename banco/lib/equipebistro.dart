class Funcionario {
  String nome;
  double salario;

  Funcionario(this.nome, this.salario);

  void trabalhar(){
    print("$nome trabalha na equipe do bistrô.");
  }
}

class Cozinheiro extends Funcionario {
  Cozinheiro(super.nome, super.salario);

  @override
  void trabalhar(){
    print("$nome trabalha na equipe do bistrô como cozinheiro.");
  }
}

class Garcom extends Funcionario {
  Garcom(super.nome, super.salario);

  @override
  void trabalhar(){
    print("$nome trabalha na equipe do bistrô como garçom.");
  }
}

class Gerente extends Funcionario {
  Gerente(super.nome, super.salario);

  @override
  void trabalhar(){
    print("$nome trabalha na equipe do bistrô como gerente.");
  }
}