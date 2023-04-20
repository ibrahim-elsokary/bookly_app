import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/error/failure.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo{
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() {
    // TODO: implement fetchBestSellerBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeatuerdBooks() {
    // TODO: implement fetchFeatuerdBooks
    throw UnimplementedError();
  }

}