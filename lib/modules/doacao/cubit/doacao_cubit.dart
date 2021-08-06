import 'package:bloc/bloc.dart';
import 'package:nubank/shared/models/doacao.dart';

class DoacaoCubit extends Cubit<Doacao> {
  DoacaoCubit() : super(Doacao(instituicao: "", valor: 0));

  void instituicao(String instituicao) =>
      emit(state.copyWith(instituicao: instituicao));
  void valor(double valor) => emit(state.copyWith(valor: valor));
}
