import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'States.dart';


class profilecubit extends Cubit<ProfileState>{
  String firstName = '';
  String lastName = '';
  String location = '';
  String imageUrl = '';
  profilecubit get(context) => BlocProvider.of(context);

  void updateFirstName(String value){
    emit(Profilechange());

  }
  void updateSecoundName(String value){
    emit(Profilechange());

  }
  void updateLocation(String value){
    emit(Profilechange());


  }
  void updateImageUrl(String value){
    emit(Profilechange());

  }
  profilecubit():super(ProfileInitial());

}