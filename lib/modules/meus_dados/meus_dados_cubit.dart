import 'package:bloc/bloc.dart';

class MeusDadosCubit extends Cubit<double> {
  MeusDadosCubit() : super(1);

  void fadeIn() => emit(1);
  void fadeOut() => emit(0.4);
}
