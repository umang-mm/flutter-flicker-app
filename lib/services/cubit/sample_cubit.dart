import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../apis/api.dart';
import '../models/photo_model.dart';
import '../models/photos_list.dart';
import 'sample.dart';

class SampleCubit extends Cubit<Sample> {
  SampleCubit() : super(SampleInitState(false));

  Future<List<PhotoModel>> onSearch(String searchValue) async {
    emit(SampleResultState(true));

    Api api = Api();
    Response response = await api.featchImageApi(searchValue, '1');

    if (response.statusCode == 200) {
      emit(SampleResultState(false));
      PhotosListModel photosModel = PhotosListModel.fromJson(response.data);
      return photosModel.photos.photo;
    } else {
      emit(SampleResultState(false));
      return [];
    }
  }
}
