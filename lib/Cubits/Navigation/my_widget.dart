import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealmaster/Cubits/Navigation/states.dart';

import '../../Admin/AdminMain.dart';
import '../../Home/MainPage.dart';
import 'navigation_cubit.dart';
import 'navigation_state.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool c = false;
    return BlocProvider(
      create: (BuildContext context) =>NavigationCubit()..getData(),
      child: BlocConsumer<NavigationCubit , States>(

        listener: (context,state){
        if(state is GetDataError){
          c = true;

        }

        },
        builder: (context,state){

          Timer(Duration(seconds: 3), () {
           NavigationCubit.get(context).getData();
           print(c);
          });
          return Scaffold(
               appBar: AppBar(),
            body: Center(child: Text('My widget'),),
          );
        },

      ),
    );
  }
}
