import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart_example/bloc/search_page_cubit/search_page_cubit.dart';
import 'package:rxdart_example/models/person.dart';
import 'package:rxdart_example/di/di.dart';

class SearchPage extends StatefulWidget {
  static PageRoute getRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (_) => locator.get<SearchPageCubit>(),
          child: const SearchPage._(),
        );
      },
    );
  }

  const SearchPage._({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _subject = PublishSubject<String>();

  @override
  void initState() {
    super.initState();
    _subject.stream
        .debounce((_) => TimerStream(_, const Duration(milliseconds: 200)))
        .listen(getCubit.search);
  }

  SearchPageCubit get getCubit => context.read();

  @override
  void dispose() {
    _subject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: TextField(
              onChanged: _subject.add,
            ),
          ),
        ],
      ),
      body: BlocBuilder<SearchPageCubit, SearchPageState>(
        builder: (context, state) {
          switch (state.status) {
            case SearchPageStatus.success:
              return ListView(
                  children: state.people.map((person) {
                return person.getWidget(context);
              }).toList());
            case SearchPageStatus.error:
              return Center(child: Text(state.error));
            case SearchPageStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
