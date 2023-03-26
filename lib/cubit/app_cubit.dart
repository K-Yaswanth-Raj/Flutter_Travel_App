import 'package:bloc/bloc.dart';
import 'package:travel_app/services/data_services.dart';
import 'app_state.dart';

class AppCubit extends Cubit<CubitStates> {
  AppCubit({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  getTravelData() async  {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (ex) {
      print(ex.toString());
    }
  }
}
