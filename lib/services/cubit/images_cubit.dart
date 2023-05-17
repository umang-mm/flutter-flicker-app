import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../apis/api.dart';
import '../models/photos_list.dart';
import 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  ImagesCubit() : super(ImagesStateInitState(false));

  void setLoader(bool loader) {
    emit(ImagesStateResultState(true, []));
  }

  void clearList() {
    emit(ImagesStateResultState(false, []));
  }

  void onSearch(String searchValue) async {
    emit(ImagesStateResultState(true, []));

    Api api = Api();
    Response response = await api.featchImageApi(searchValue, '1');

    if (response.statusCode == 200) {
      PhotosListModel photosModel = PhotosListModel.fromJson(response.data);
      emit(ImagesStateResultState(false, photosModel.photos.photo));
    } else {
      emit(ImagesStateResultState(false, []));
    }
  }
}
