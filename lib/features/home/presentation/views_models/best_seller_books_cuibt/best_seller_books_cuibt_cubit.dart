import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';


import '../../../data/repos/home_repo.dart';

part 'best_seller_books_cuibt_state.dart';

class BestSellerBooksCuibtCubit extends Cubit<BestSellerBooksCuibtState> {
  BestSellerBooksCuibtCubit(this.homeRepo) : super(BestSellerBooksCuibtInitial());
   final HomeRepo homeRepo;

  Future<void> fetchBestSellerBooks() async {
    emit(BestSellerBooksLoading());
    var result = await homeRepo.fetchBestSellerBooks();
    result.fold((failure) {
      emit(BestSellerBooksFailure(failure.errorMsg));
    }, (books) {
      emit(BestSellerBooksSuccess(books as List<BookModel>));
    });
  }
}
