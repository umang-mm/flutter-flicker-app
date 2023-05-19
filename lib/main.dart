/// Flutter
import 'package:flicker_app/screens/image_detail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/home.dart';

void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: "/imageDetail",
      builder: (context, state) => ImageDetail(
        imageUrl: state.queryParameters['imageUrl'] as String,
        imageTitle: state.queryParameters['imageTitle'] as String,
      ),
    )
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: "Go router",
    );
  }
}
