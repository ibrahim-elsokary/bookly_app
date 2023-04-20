part of 'featurd_book_cuibt_cubit.dart';

abstract class FeaturdBookCuibtState extends Equatable {
  const FeaturdBookCuibtState();

  @override
  List<Object> get props => [];
}

class FeaturdBookCuibtInitial extends FeaturdBookCuibtState {}

class FeaturdBookCuibtLoading extends FeaturdBookCuibtState {}

class FeaturdBookCuibtSuccess extends FeaturdBookCuibtState {
  final List<BookModel> books;
  const FeaturdBookCuibtSuccess(this.books);
}

class FeaturdBookCuibtFailure extends FeaturdBookCuibtState {
  final String errorMsg;
  const FeaturdBookCuibtFailure(this.errorMsg);
}
