import 'package:bloc/bloc.dart';
import 'package:nubank/shared/models/emprestimo.dart';

class EmprestimoCubit extends Cubit<Emprestimo> {
  EmprestimoCubit(Emprestimo initialState) : super(initialState);

  void init() => emit(Emprestimo(tipo: 'pessoal', valor: 100, parcelas: 12));
  void objetivo(String objetivo) => emit(state.copyWith(objetivo: objetivo));
  void tipo(String tipo) => emit(state.copyWith(tipo: tipo));
  void valor(double valor) => emit(state.copyWith(valor: valor));
  void edit(bool edit) => emit(state.copyWith(edit: edit));
}
