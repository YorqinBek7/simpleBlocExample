import 'package:bloc_test/data/api_service.dart';
import 'package:bloc_test/data/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_memes_bloc_event.dart';
part 'get_memes_bloc_state.dart';

class GetMemesBloc extends Bloc<GetMemesBlocEvent, GetMemesState> {
  GetMemesBloc() : super(GetMemesBlocInitial()) {
    on<GetMemesBlocEvent>(getMemes);
  }
  getMemes(GetMemesBlocEvent event, Emitter<GetMemesState> emit) async {
    if (event is GetMemesEvent) {
      emit(GetMemesBlocLoading());
      try {
        List<MemesModel> memes = await ApiService.getMemes();
        emit(GetMemesBlocSuccess(memes: memes));
      } catch (e) {
        emit(GetMemesBlocError(error: e.toString()));
      }
    }
  }
}
