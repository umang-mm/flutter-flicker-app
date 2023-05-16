import 'package:easy_debounce/easy_debounce.dart';
import 'package:flicker_app/services/models/photo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/image_card.dart';
import '../components/loader.dart';
import '../components/search_bar.dart';
import '../main.dart';
import '../services/cubit/images_cubit.dart';
import '../services/cubit/images_state.dart';

class Home extends State<AppNavigator> {
  final TextEditingController _controller = TextEditingController();
  String searchValue = '';
  final ImagesCubit _sampleCubit = ImagesCubit();

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

  void _onValueChange() {
    if (_controller.text.isEmpty) {
      _sampleCubit.setImagesList([]);
    }

    if (_controller.text.isNotEmpty && _controller.text != searchValue) {
      _sampleCubit.setLoader(true);

      EasyDebounce.debounce(
          'on-search-debouncer', // <-- An ID for this particular debouncer
          const Duration(milliseconds: 1000), // <-- The debounce duration
          () => _sampleCubit.onSearch(_controller.text) // <-- The target method
          );
    }

    setState(() {
      searchValue = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _sampleCubit,
      child: BlocBuilder<ImagesCubit, ImagesState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  renderSearchBar(_controller),
                  if (searchValue.isNotEmpty)
                    renderList(context, state.imagesList)
                ],
              ),
            ),
            appBar: AppBar(
              title: const Text('Home Screen'),
            ),
          );
        },
      ),
    );
  }
}

Widget renderList(BuildContext context, List<PhotoModel> images) {
  return BlocBuilder<ImagesCubit, ImagesState>(builder: (context, state) {
    if (state.loader) {
      return screenLoader();
    } else if (images.isNotEmpty) {
      return Expanded(
        child: ListView.builder(
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return renderImageCard(
                  'https://live.staticflickr.com/${images[index].server}/${images[index].id}_${images[index].secret}_z.jpg',
                  images[index].title,
                  context);
            }),
      );
    } else {
      return const Text('Images are not available!');
    }
  });
}
