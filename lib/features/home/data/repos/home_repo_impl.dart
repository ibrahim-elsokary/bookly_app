import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/error/failure.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo{
  final ApiService apiService ;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() async {
    try {
      List<BookModel> books = [] ;
      var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=best seller');
      for(var item in data['items']){
        books.add(item);
      }

      return right(books);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeatuerdBooks() {
    // TODO: implement fetchFeatuerdBooks
    throw UnimplementedError();
  }

}