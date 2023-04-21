import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/error/failure.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchResults(String search) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchResults(search);
    result.fold((failure) {
      emit(SearchFailure(failure.errorMsg));
    }, (books) {
      emit(SearchSuccess(books));
    });
  }
}
