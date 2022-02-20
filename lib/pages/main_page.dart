import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart_example/bloc/main_page_bloc/main_page_bloc.dart';
import 'package:rxdart_example/models/ticker.dart';
import 'package:rxdart_example/di/di.dart';
import 'package:rxdart_example/pages/search_page.dart';

class MainPage extends StatelessWidget {
  static Widget create() {
    return Provider(
      create: (_) => locator.get<MainPageBloc>()..init(),
      child: const MainPage._(),
    );
  }

  const MainPage._({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainPageBloc = Provider.of<MainPageBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<List<Ticker>>(
        stream: mainPageBloc.behaviorSubject.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return snapshot.data?[index].getWidget(context, index) ??
                    const SizedBox.shrink();
              },
              itemCount: snapshot.data?.length,
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
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
