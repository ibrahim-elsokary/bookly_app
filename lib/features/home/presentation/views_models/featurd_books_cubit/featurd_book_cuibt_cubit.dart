import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/utils/error/failure.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featurd_book_cuibt_state.dart';

class FeaturdBookCuibtCubit extends Cubit<FeaturdBookCuibtState> {
  FeaturdBookCuibtCubit(this.homeRepo) : super(FeaturdBookCuibtInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturdBookCuibtLoading());
    var result = await homeRepo.fetchFeatuerdBooks();
    result.fold((failure) {
      emit(FeaturdBookCuibtFailure(failure.errorMsg));
    }, (books) {
      emit(FeaturdBookCuibtSuccess(books));
    });
  }
}
