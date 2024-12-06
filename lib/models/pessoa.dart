
class Pessoa {
  String _nome = "";
  double _peso = 0.0;
  double _altura = 0.0;

  Pessoa(String nome, double peso, altura) {
    _nome = nome;
    _peso = peso;
    _altura = altura;
  }
  
  String getNome() {
    return _nome;
  }
  
  double getPeso() {
    return _peso;
  }

  double getAltura() {
    return _altura;
  }
  void setNome(String nome) {
    _nome = nome;
  }
  
  void setPeso(double peso) {
    _peso = peso;
  }
  
  void setAltura(double altura) {
    _altura = altura;
  }

  double calcularIMC() {
    return _peso / (_altura * _altura);
  }
  
  double calcularPorcentagemGordura() {
  double imc = calcularIMC(); 
  double gordura = (imc * 0.8); 
  return gordura.roundToDouble(); 
}

@override
String toString() {
  return "Nome: $_nome, Peso: $_peso kg, Altura: $_altura m, IMC: ${calcularIMC()}, Porcentagem de Gordura: ${calcularPorcentagemGordura()}%";
}

void verificarIMC(Pessoa pessoa) {
  double imc = pessoa.calcularIMC();
  double gordura = pessoa.calcularPorcentagemGordura(); 
  
  print(imc.toString());
  
  String faixaIMC = imc >= 18 && imc <= 25
      ? 'IMC está entre 18 e 25'
      : 'IMC fora do intervalo';
  print(faixaIMC);

  if (imc >= 30) {
    print("Obesidade");
    print("Pratique exercícios!!!");
    print("Recomenda-se atividades aeróbicas como corrida, natação ou ciclismo, além de musculação.");
  } else if (imc >= 25) {
    print("Acima do peso");
    print("Inicie com atividades aeróbicas para queima de gordura, como caminhada, corrida leve, ou natação.");
  } else if (imc >= 18) {
    print("Peso ideal");
    print("Mantenha-se ativo com exercícios regulares, como musculação, yoga ou atividades aeróbicas.");
  } else {
    print("Abaixo do peso");
    print("Considere realizar exercícios de resistência para ganhar massa muscular e aumentar a força.");
  }

  if (gordura > 25) {
    print("Você tem uma porcentagem de gordura elevada. Exercícios para redução de gordura são recomendados.");
    print("Inclua exercícios aeróbicos e musculação para aumentar a queima de gordura.");
  } else if (gordura > 15) {
    print("Sua porcentagem de gordura é média. Mantenha-se ativo com exercícios regulares.");
  } else {
    print("Sua porcentagem de gordura está baixa. Continue com atividades de resistência e musculação.");
  }
}


}