import 'package:bloc/bloc.dart';

class DoacaoInstituicaoCubit extends Cubit<String> {
  DoacaoInstituicaoCubit() : super("");

  void instituicao(String instituicao) => emit(instituicao);
}
