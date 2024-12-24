import 'package:untitled/modules/counter/Cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit(): super(CounterInitial());
  static CounterCubit get(context)=>BlocProvider.of(context);
  void minus()
  {
    counter--;
    emit(CounterMinus());
  }
  void plus()
  {

    counter++;
    emit(CounterPlus());
  }
  int counter =1;
}