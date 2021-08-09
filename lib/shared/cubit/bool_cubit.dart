import 'package:bloc/bloc.dart';

class BoolCubit extends Cubit<bool> {
  BoolCubit(bool initialState) : super(initialState);

  void change(bool value) => emit(value);
}
