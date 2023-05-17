import 'package:easy_debounce/easy_debounce.dart';
import 'package:flicker_app/services/bloc/images_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/image_list.dart';
import '../components/search_bar.dart';
import '../main.dart';
import '../services/bloc/images_bloc.dart';
import '../services/bloc/images_event.dart';

class Home extends State<AppNavigator> {
  final TextEditingController _controller = TextEditingController();
  String searchValue = '';
  final ImagesBloc _imagesBloc = ImagesBloc();

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
      _imagesBloc.add(ClearListEvent());
    }

    if (_controller.text.isNotEmpty && _controller.text != searchValue) {
      _imagesBloc.add(ScreenLoaderEvent(true));

      EasyDebounce.debounce(
          'on-search-debouncer', // <-- An ID for this particular debouncer
          const Duration(milliseconds: 1000), // <-- The debounce duration
          () => _imagesBloc
              .add(OnSearchEvent(_controller.text)) // <-- The target method
          );
    }

    setState(() {
      searchValue = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _imagesBloc,
      child: BlocBuilder<ImagesBloc, ImagesState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  renderSearchBar(_controller),
                  if (searchValue.isNotEmpty)
                    renderImageList(context, state.imagesList)
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
