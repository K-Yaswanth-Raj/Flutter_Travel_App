import 'package:bloc/bloc.dart';
import 'app_state.dart';
class AppCubit extends Cubit<CubitStates> {
  AppCubit() : super(InitialState()) {
    emit(WelcomeState());
  }
}
