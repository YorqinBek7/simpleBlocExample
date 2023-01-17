import 'package:bloc_test/bloc/get_memes_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<GetMemesBloc>(context).add(GetMemesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Getx Test'),
          backgroundColor: Colors.cyan,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: BlocBuilder<GetMemesBloc, GetMemesState>(
                builder: (context, state) {
                  if (state is GetMemesBlocLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GetMemesBlocError) {
                    return Text(state.error);
                  } else if (state is GetMemesBlocSuccess) {
                    var data = state.memes;
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          ListTile(
                            dense: true,
                            isThreeLine: true,
                            onTap: () => {},
                            title: Text(data[index].name),
                            subtitle: Text(data[index].id),
                            trailing: Image.network(data[index].url),
                          ),
                          Divider(),
                        ],
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
          ],
        ));
  }
}
