import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flicker_app/services/apis/api.dart';
import 'package:flicker_app/services/bloc/images_state.dart';

import '../models/photos_list.dart';
import 'images_event.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  ImagesBloc() : super(ImagesStateInitState(false)) {
    on<ScreenLoaderEvent>((event, emit) async {
      bool loader = event.screenLoader;
      emit(ImagesStateResultState(loader, []));
    });

    on<ClearListEvent>((event, emit) async {
      emit(ImagesStateResultState(false, []));
    });

    on<OnSearchEvent>((event, emit) async {
      Api api = Api();
      Response response = await api.featchImagesApi(event.searchValue, '1');

      if (response.statusCode == 200) {
        PhotosListModel photosModel = PhotosListModel.fromJson(response.data);
        emit(ImagesStateResultState(false, photosModel.photos.photo));
      } else {
        emit(ImagesStateResultState(false, []));
      }
    });
  }
}
