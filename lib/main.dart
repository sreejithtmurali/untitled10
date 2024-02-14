import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'apiService.dart';
import 'api_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final ApiBloc apiBloc = ApiBloc(apiService: ApiService(baseUrl: 'your_base_url'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter API Demo'),
      ),
      body: BlocProvider(
        create: (context) => apiBloc,
        child: BlocBuilder<ApiBloc, ApiState>(
          builder: (context, state) {
            if (state is ApiInitialState) {
              return Center(
                child: Text('Initial State'),
              );
            } else if (state is ApiLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ApiLoadedState) {
              return Center(
                child: Text('Loaded Data: ${state.data}'),
              );
            } else if (state is ApiErrorState) {
              return Center(
                child: Text('Error: ${state.message}'),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Dispatch an event to fetch data
          apiBloc.add(FetchData('your_endpoint'));
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
