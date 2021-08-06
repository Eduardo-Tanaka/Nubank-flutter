import 'package:bloc/bloc.dart';

class AjudaCubit extends Cubit<bool> {
  AjudaCubit() : super(false);

  void showBottom() => emit(true);
}
