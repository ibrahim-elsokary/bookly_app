import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure,List<BookModel>>> fetchSearchResults(String search);
}