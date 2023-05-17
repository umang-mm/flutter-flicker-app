import '../http.dart';

class Api {
  dynamic errorMessage;

  dynamic featchImagesApi(searchValue, page) async {
    try {
      final response = await dio.get('', queryParameters: {
        'api_key': '683197535373a2bc23abcd236aad2d22',
        'tags': searchValue,
        'text': searchValue,
        'page': page,
        'method': 'flickr.photos.search',
        'format': 'json',
        'nojsoncallback': '1',
        'perpage': '10',
      });

      return response;
    } catch (e) {
      errorMessage = e;
    }
  }
}
