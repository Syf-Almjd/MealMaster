import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealmaster/Cubits/Navigation/my_widget.dart';
import 'package:mealmaster/Cubits/Navigation/states.dart';

class NavigationCubit extends Cubit<States> {
  NavigationCubit() : super(StatesInital());

  static NavigationCubit get(context) => BlocProvider.of(context);

  void navigate(context, widget) {
    emit(widget());
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => widget()));
  }

  void getData() {
    emit(GetDataError());
  }

  void navigateToHome() {
    print("object");
    //  emit(NavigationState(page: 'home'));
  }

  void navigateToAdmin() {
    // emit(NavigationState(page: 'Admin'));
  }

  void introSliderLogout() {
    // emit(NavigationState(page: 'introSlider'));
  }
}
