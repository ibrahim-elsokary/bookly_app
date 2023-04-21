import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/error/failure.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl  implements SearchRepo{
  final ApiService apiService;

  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchResults(String search) async{
    try {
      List<BookModel> books = [];
      var result = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=$search');
      for (var item in result['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }


  
}