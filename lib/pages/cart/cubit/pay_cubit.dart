import 'package:bloc/bloc.dart';
import 'package:hamburguer_app/pages/home_page/cubit/home_cubit.dart';

part 'pay_state.dart';

class PayCubit extends Cubit<PayState> {
  PayCubit() : super(PayInitial());

  void emitPay(){
    emit(PayLoading());
    emit(PayInitial());
  }
  
}
