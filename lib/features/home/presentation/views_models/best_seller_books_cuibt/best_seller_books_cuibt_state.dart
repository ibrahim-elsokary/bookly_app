part of 'best_seller_books_cuibt_cubit.dart';

abstract class BestSellerBooksCuibtState extends Equatable {
  const BestSellerBooksCuibtState();

  @override
  List<Object> get props => [];
}

class BestSellerBooksCuibtInitial extends BestSellerBooksCuibtState {}


class BestSellerBooksLoading extends BestSellerBooksCuibtState {}

class BestSellerBooksSuccess extends BestSellerBooksCuibtState {
  final List<BookModel> books;
  const BestSellerBooksSuccess(this.books);
}

class BestSellerBooksFailure extends BestSellerBooksCuibtState {
  final String errorMsg;
  const BestSellerBooksFailure(this.errorMsg);
}
