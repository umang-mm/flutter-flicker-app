import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/cubit/images_cubit.dart';
import '../services/cubit/images_state.dart';
import '../services/models/photo_model.dart';
import 'image_card.dart';
import 'loader.dart';

Widget renderImageList(BuildContext context, List<PhotoModel> images) {
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
