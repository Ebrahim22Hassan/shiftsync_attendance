import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../errors/failure.dart';

typedef Execution<T> = Future<Either<Failure, T>> Function();

class UseCaseExecutor {
  static Future<Either<Failure, T>> execute<T>({
    required void Function() onLoading,
    required Execution<T> useCase,
    required void Function(T) onSuccess,
    required void Function(Failure) onFailure,
  }) async {
    try {
      onLoading();
    } catch (e, a) {
      log('Error during onLoading: $e, $a', name: 'UseCaseExecutor $T');
      onFailure(ServerFailure('Error during onLoading: $e'));
      return Left(ServerFailure('Error during onLoading: $e'));
    }
    try {
      final result = await useCase();
      return result.fold((failure) {
        onFailure(failure);
        return Left(failure);
      }, (data) {
        onSuccess(data);
        return Right(data);
      },
      );
    } catch (e, a) {
      log('Error: $e, $a', name: 'E $T');
      log('Error: $e', name: 'E $T');
      onFailure(ServerFailure(e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }

  static void paginate<T>({
    required int limit,
    required List<T> currentData,
    required List<T> newData,
    required Function(List<T>) updateData,
    required Function() onLoadMore,
    required Function() onNoMoreData,
  }) {
    if (newData.length < limit) {
      onNoMoreData();
    } else {
      updateData(newData);
      onLoadMore();
    }
  }

  static String failure<T>(Failure failure) {
    log('Error: $failure', name: 'UseCaseExecutor $T');
    switch (failure.runtimeType) {
      case ServerFailure _:
        return '${failure.runtimeType}';
      case EmptyCacheFailure _:
        return 'OFFLINE_FAILURE_MESSAGE';
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}