import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'StatesScreen.dart';

class logincubit extends Cubit<loginstates>{
  logincubit():super(loginInitial());
  static logincubit get(context)=>BlocProvider.of(context);
  bool isPassword=true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    emit(loginchange());

  }
}