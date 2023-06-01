import 'package:bloc/bloc.dart';

part 'app_component_state.dart';

class AppComponentCubit extends Cubit<AppComponents> {
  AppComponentCubit() : super(AppComponents(isLoading: false));

  void startLoading() => emit(AppComponents(isLoading: true));
  void stopLoading() => emit(AppComponents(isLoading: false));

}
