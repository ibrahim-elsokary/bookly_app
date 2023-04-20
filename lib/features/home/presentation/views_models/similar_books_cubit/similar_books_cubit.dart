import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/error/failure.dart';

import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks(String category) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category);
    result.fold((failure) {
      emit(
        SimilarBooksFailure(failure.errorMsg),
      );
    }, (books) {
      emit(
        SimilarBooksSuccess(books as  List<BookModel>),
      );
    });
  }
}
