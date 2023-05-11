import 'package:dio/dio.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flicker_app/services/models/photo_model.dart';
import 'package:flutter/material.dart';

import '../components/search_bar.dart';
import '../main.dart';
import '../services/apis/api.dart';
import '../services/models/photos_list.dart';

class Home extends State<AppNavigator> {
  final TextEditingController _controller = TextEditingController();
  String searchValue = '';
  List<PhotoModel> images = [];

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
    Api api = Api();
    Response response = await api.featchImageApi(searchValue, '1');
    PhotosListModel photosModel = PhotosListModel.fromJson(response.data);

    setState(() {
      images = photosModel.photos.photo;
    });
  }

  void _onValueChange() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        searchValue = _controller.text;
      });

      EasyDebounce.debounce(
          'on-search-debouncer', // <-- An ID for this particular debouncer
          const Duration(milliseconds: 1000), // <-- The debounce duration
          () => onSearch(_controller.text) // <-- The target method
          );
    }
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
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.6,
              //   child: ListView.builder(
              //     scrollDirection: Axis.vertical,
              //     itemCount: images.length,
              //     itemBuilder: (context, index) {
              //       return renderCard();
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
