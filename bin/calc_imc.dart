import 'dart:io';

import 'package:calc_imc/models/pessoa.dart';


void main() {
  // Solicita a entrada do usuário para nome, peso e altura
  print("Por favor, insira seu nome:");
  String nome = stdin.readLineSync() ?? "";

  print("Por favor, insira seu peso (kg):");
  double peso = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  print("Por favor, insira sua altura (m):");
  double altura = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  // Cria a instância de Pessoa com os dados fornecidos
  Pessoa pessoa = Pessoa(nome, peso, altura);

  // Exibe os dados e realiza o cálculo do IMC e da porcentagem de gordura
  print("\nDados inseridos:");
  print("Nome: ${pessoa.getNome()}");
  print("Peso: ${pessoa.getPeso()} kg");
  print("Altura: ${pessoa.getAltura()} m");

  // Chama o método para verificar IMC e gordura
  pessoa.verificarIMC(Pessoa(nome, peso, altura));
  // pessoa.calcularIMC().toString();
}