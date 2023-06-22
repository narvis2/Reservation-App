import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;
  final String? message;

  const DataState({this.data, this.error, this.message});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataError<T> extends DataState<T> {
  const DataError(DioException error) : super(error: error);
}

class DataNetworkError<T> extends DataState<T> {
  const DataNetworkError(String? message)
      : super(message: message);
}