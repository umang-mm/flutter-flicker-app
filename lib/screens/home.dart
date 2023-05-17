import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/image_list.dart';
import '../components/search_bar.dart';
import '../main.dart';
import '../services/cubit/images_cubit.dart';
import '../services/cubit/images_state.dart';

class Home extends State<AppNavigator> {
  final TextEditingController _controller = TextEditingController();
  String searchValue = '';
  final ImagesCubit _imagesCubit = ImagesCubit();

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
      _imagesCubit.clearList();
    }

    if (_controller.text.isNotEmpty && _controller.text != searchValue) {
      _imagesCubit.setLoader(true);

      EasyDebounce.debounce(
          'on-search-debouncer', // <-- An ID for this particular debouncer
          const Duration(milliseconds: 1000), // <-- The debounce duration
          () => _imagesCubit.onSearch(_controller.text) // <-- The target method
          );
    }

    setState(() {
      searchValue = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _imagesCubit,
      child: BlocBuilder<ImagesCubit, ImagesState>(
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
