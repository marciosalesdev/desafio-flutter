import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:calc_imc/models/pessoa.dart' as app;

// Mock da classe Pessoa
class MockPessoa extends Mock implements app.Pessoa {}

void main() {
  group('Testes de Cálculos e Lógica', () {
    test('Testar cálculo do IMC', () {
      // Arrange
      final pessoa = app.Pessoa("Marcio Sales", 103.0, 1.79);

      // Act
      double imc = pessoa.calcularIMC();

      // Assert
      expect(imc, closeTo(32.15, 0.01)); // Verifica se o IMC está correto
    });

    test('Testar cálculo da porcentagem de gordura', () {
      // Arrange
      final pessoa = app.Pessoa("Marcio Sales", 103.0, 1.80);

      // Act
      double gordura = pessoa.calcularPorcentagemGordura();

      // Assert
      expect(gordura, 25); // A porcentagem de gordura deve ser arredondada para 25%
    });

    test('Testar a lógica de IMC e gordura', () {
      // Arrange
      final pessoa = app.Pessoa("Marcio Sales", 103.0, 1.79);

      // Act & Assert
      pessoa.verificarIMC(pessoa); // Esse teste vai apenas imprimir a saída no console
    });

    test('Testar o setter e getter de atributos', () {
      // Arrange
      final pessoa = app.Pessoa("Marcio Sales", 103.0, 1.79);

      // Act
      pessoa.setPeso(105.0);
      pessoa.setAltura(1.80);

      // Assert
      expect(pessoa.getPeso(), 105.0);
      expect(pessoa.getAltura(), 1.80);
    });
  });

  group('Mock Test', () {
    test('Testar comportamento com MockPessoa', () {
      // Arrange
      final mockPessoa = MockPessoa();
      // Mockando os retornos dos métodos
      when(mockPessoa.calcularIMC()).thenReturn(32.0);
      when(mockPessoa.calcularPorcentagemGordura()).thenReturn(31.0);

      // Act
      double imc = mockPessoa.calcularIMC();
      double gordura = mockPessoa.calcularPorcentagemGordura();

      // Assert
      expect(imc, 32.0);
      expect(gordura, 31.0);

      // Verificar se os métodos foram chamados
      verify(mockPessoa.calcularIMC()).called(1);
      verify(mockPessoa.calcularPorcentagemGordura()).called(1);
    });
  });
}
