import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart_example/bloc/main_page_bloc/main_page_bloc.dart';
import 'package:rxdart_example/di/di.dart';
import 'package:rxdart_example/models/ticker.dart';
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
          if (snapshot.hasError) return Text(snapshot.error.toString());

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemBuilder: (context, index) {
              return _buildTicker(snapshot.data?[index], index);
            },
            itemCount: snapshot.data?.length,
          );
        },
      ),
      floatingActionButton: IconButton(
        icon: const Icon(Icons.search),
        onPressed: () => Navigator.of(context).push(SearchPage.getRoute()),
      ),
    );
  }

  Widget _buildTicker(Ticker? ticker, int index) {
    if (ticker == null) return const SizedBox.shrink();

    return Column(
      children: [
        Text(ticker.symbol),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(index.toString()),
            Text(ticker.name),
            Text(ticker.maxSupply.toString()),
          ],
        ),
        const SizedBox(height: 16),
        const Divider(),
      ],
    );
  }
}
