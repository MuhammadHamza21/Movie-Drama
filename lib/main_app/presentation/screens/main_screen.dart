import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_drama/main_app/presentation/controller/bloc/main_app_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainAppBloc(),
      child: BlocBuilder<MainAppBloc, MainAppState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.currentIndex,
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              onTap: (value) {
                MainAppBloc.get(context).add(ChangeCurrentIndexEvent(value));
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                bottomNavigationBarItem(icon: Icons.movie, label: "Movies"),
                bottomNavigationBarItem(icon: Icons.tv, label: "TV"),
              ],
            ),
            body: state.screens[state.currentIndex],
          );
        },
      ),
    );
  }
}

BottomNavigationBarItem bottomNavigationBarItem({
  required IconData icon,
  required String label,
}) =>
    BottomNavigationBarItem(
      icon: Icon(
        icon,
      ),
      label: label,
    );
