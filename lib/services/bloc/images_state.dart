import '../models/photo_model.dart';

abstract class ImagesState {
  final bool loader;
  final List<PhotoModel> imagesList;
  const ImagesState(this.loader, this.imagesList);
}

class ImagesStateInitState extends ImagesState {
  ImagesStateInitState(bool val) : super(false, []);
}

class ImagesStateResultState extends ImagesState {
  ImagesStateResultState(bool val, List<PhotoModel> imagesList)
      : super(val, imagesList);
}
