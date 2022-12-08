// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:testing_app/feature/number_trivia/domain/entities/number_trivia.dart';
import 'package:testing_app/feature/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/feature/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

class MockNumberTriviaRepositoy extends Mock implements NumberTriviaRepository {
}
@GenerateMocks([NumberTriviaRepository])
void main() {
  late GetConcreteNumberTrivia usecases;
  late MockNumberTriviaRepositoy mockNumberTriviaRepositoy;

  setUp(() {
    mockNumberTriviaRepositoy = MockNumberTriviaRepositoy();
    usecases = GetConcreteNumberTrivia(mockNumberTriviaRepositoy);
  });

  const tNumber = 1;
  const tNumberTrivia =
       NumberTrivia(text: 'test: got number trivia success', number: 1);

  test('should get trivia for the number from repository', () async {
    // arrange
    when(mockNumberTriviaRepositoy.getConcreteNumberTrivia(tNumber))
        .thenAnswer((_) async => const Right(tNumberTrivia));

    // act
    final result = usecases(const Params(number: tNumber));

    //assert
    expect(result, const Right(tNumberTrivia));
    verify(mockNumberTriviaRepositoy.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepositoy);
  });
}
