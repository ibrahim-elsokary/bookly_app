import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'featurd_book_cuibt_state.dart';

class FeaturdBookCuibtCubit extends Cubit<FeaturdBookCuibtState> {
  FeaturdBookCuibtCubit() : super(FeaturdBookCuibtInitial());
}
