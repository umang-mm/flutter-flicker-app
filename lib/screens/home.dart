import 'package:dio/dio.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flicker_app/services/models/photo_model.dart';
import 'package:flutter/material.dart';

import '../components/image_card.dart';
import '../components/loader.dart';
import '../components/search_bar.dart';
import '../main.dart';
import '../services/apis/api.dart';
import '../services/models/photos_list.dart';

class Home extends State<AppNavigator> {
  final TextEditingController _controller = TextEditingController();
  String searchValue = '';
  List<PhotoModel> images = [];
  bool loader = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onValueChange);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onSearch(searchValue) async {
    setState(() {
      loader = true;
    });

    Api api = Api();
    Response response = await api.featchImageApi(searchValue, '1');
    PhotosListModel photosModel = PhotosListModel.fromJson(response.data);

    setState(() {
      images = photosModel.photos.photo;
      loader = false;
    });
  }

  void _onValueChange() {
    if (_controller.text.isNotEmpty && _controller.text != searchValue) {
      EasyDebounce.debounce(
          'on-search-debouncer', // <-- An ID for this particular debouncer
          const Duration(milliseconds: 1000), // <-- The debounce duration
          () => onSearch(_controller.text) // <-- The target method
          );
    } else {
      setState(() {
        loader = false;
      });
    }

    setState(() {
      searchValue = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              renderSearchBar(_controller),
              if (searchValue.isNotEmpty)
                if (loader)
                  screenLoader()
                else if (images.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                        itemCount: images.length,
                        itemBuilder: (BuildContext context, int index) {
                          return renderImageCard(
                              'https://live.staticflickr.com/${images[index].server}/${images[index].id}_${images[index].secret}_z.jpg',
                              images[index].title,
                              context);
                        }),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
