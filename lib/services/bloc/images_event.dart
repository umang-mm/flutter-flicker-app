abstract class ImagesEvent {}

class ScreenLoaderEvent extends ImagesEvent {
  final bool screenLoader;
  ScreenLoaderEvent(this.screenLoader);
}

class ClearListEvent extends ImagesEvent {}

class OnSearchEvent extends ImagesEvent {
  final String searchValue;
  OnSearchEvent(this.searchValue);
}
