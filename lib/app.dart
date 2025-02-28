import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:insta_clone/direct_messages/cubit/message_cubit.dart';
import 'package:insta_clone/home/screens/home.dart';
import 'package:insta_clone/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MessageCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'Instagram clone',
          debugShowCheckedModeBanner: false,
          theme: CustomThemes.lightTheme,
          darkTheme: CustomThemes.darkTheme,
          themeMode: ThemeMode.light,
          home: const HomePageView(),
        ),
      ),
    );
  }
}
