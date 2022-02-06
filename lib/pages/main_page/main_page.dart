import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart_example/bloc/main_page_cubit/main_page_cubit.dart';
import 'package:rxdart_example/di/di.dart';

class MainPage extends StatelessWidget {
  static Widget create() {
    return BlocProvider(
      create: (_) => locator.get<MainPageCubit>(),
      child: const MainPage(),
    );
  }

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<MainPageCubit, MainPageState>(
        builder: (context, state) {
          if (state.status == MainPageStatus.success) {
            return ListView(
              children: state.tickers.map((e) {
                return Text(e.name);
              }).toList(),
            );
          } else {
            return const CircleAvatar();
          }
        },
      ),
    );
  }
}
