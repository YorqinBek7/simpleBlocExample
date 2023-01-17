part of 'get_memes_bloc_bloc.dart';

@immutable
abstract class GetMemesState {}

class GetMemesBlocInitial extends GetMemesState {}

class GetMemesBlocLoading extends GetMemesState {}

class GetMemesBlocSuccess extends GetMemesState {
  List<MemesModel> memes;
  GetMemesBlocSuccess({required this.memes});
}

class GetMemesBlocError extends GetMemesState {
  String error;
  GetMemesBlocError({required this.error});
}
