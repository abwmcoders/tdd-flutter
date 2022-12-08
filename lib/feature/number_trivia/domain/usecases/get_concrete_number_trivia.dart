// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:testing_app/core/error/failure.dart';
import 'package:testing_app/feature/number_trivia/domain/entities/number_trivia.dart';
import 'package:testing_app/feature/number_trivia/domain/repositories/number_trivia_repository.dart';

import '../../../../core/usecases/usecases.dart';

class GetConcreteNumberTrivia implements UseCases<NumberTrivia, Params> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>?> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable {
  final int number;

  const Params({required this.number});

  @override
  List<Object?> get props => [number];
}
