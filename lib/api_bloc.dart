import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'apiService.dart';

part 'api_event.dart';
part 'api_state.dart';

// Bloc
class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final ApiService apiService;

  ApiBloc({required this.apiService}) : super(ApiInitialState());

  @override
  Stream<ApiState> mapEventToState(ApiEvent event) async* {
    if (event is FetchData) {
      yield ApiLoadingState();
      try {
        final data = await apiService.getData(event.endpoint);
        yield ApiLoadedState(data);
      } catch (e) {
        yield ApiErrorState(e.toString());
      }
    }
    // Add more event handling for POST, PUT, DELETE if needed
  }
}
