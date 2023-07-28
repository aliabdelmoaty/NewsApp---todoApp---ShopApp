import 'package:bloc/bloc.dart';
import 'package:flutter2/models/counterapp/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit() : super(CounterInitialState());
  static CounterCubit get(context) => BlocProvider.of(context);
  int counter =1;
  void minus (){
    counter--;
    emit(CounterMinusState(counter));
  }
  void plus (){
    counter++;
    emit(CounterPlusState(counter));
  }

}