import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'States.dart';

class RigesterCubit extends Cubit<RegisterState> {
  TextEditingController PhoneController = TextEditingController();
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController LocationController = TextEditingController();

  bool isPassword=true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    emit(Registerchange());

  }

  RigesterCubit() :super(RegisterInitial());

  RigesterCubit get(context) => BlocProvider.of(context);
  String firstName = '';
  String lastName = '';
  String location = '';
  String imageUrl = '';

  void updateFirstName(String value){
    emit(Registerchange());

  }
  void updatephone(String value){
    emit(Registerchange());

  }
  void updatepassword(String value){
    emit(Registerchange());

  }

  void updateSecoundName(String value){
    emit(Registerchange());

  }
  void updateLocation(String value){
    emit(Registerchange());

  }
  void updateImageUrl(String value){
    emit(Registerchange());

  }

}
