import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart_example/models/ticker.dart';
import 'package:rxdart_example/bloc/main_page_cubit/main_page_cubit.dart';
import 'package:rxdart_example/di/di.dart';
import 'package:rxdart_example/pages/search_page.dart';

class MainPage extends StatelessWidget {
  static Widget create() {
    return BlocProvider(
      create: (_) => locator.get<MainPageCubit>(),
      child: const MainPage._(),
    );
  }

  const MainPage._({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<MainPageCubit, MainPageState>(
        builder: (context, state) {
          return StreamBuilder<List<Ticker>>(
            stream: state.tickers.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: snapshot.data
                          ?.map((e) => e.getWidget(context))
                          .toList() ??
                      [],
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        },
      ),
      floatingActionButton: IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          Navigator.of(context).push(SearchPage.getRoute());
        },
      ),
    );
  }
}
