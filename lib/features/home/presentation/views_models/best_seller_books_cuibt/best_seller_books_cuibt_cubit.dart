import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'best_seller_books_cuibt_state.dart';

class BestSellerBooksCuibtCubit extends Cubit<BestSellerBooksCuibtState> {
  BestSellerBooksCuibtCubit(this.homeRepo) : super(BestSellerBooksCuibtInitial());
   final HomeRepo homeRepo;

  Future<void> fetchBestSellerBooks() async {
    emit(BestSellerBooksLoading());
    var result = await homeRepo.fetchFeatuerdBooks();
    result.fold((failure) {
      emit(BestSellerBooksFailure(failure.errorMsg));
    }, (books) {
      emit(BestSellerBooksSuccess(books));
    });
  }
}
