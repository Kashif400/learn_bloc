import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/api_services.dart';

import '../../asif learn bloc/favourite/favourite_bloc.dart';
import '../../asif learn bloc/favourite/favourite_event.dart';
import '../../asif learn bloc/favourite/favourite_state.dart';
import '../../model/favourite_item_model.dart';
import 'widget/delete_button_widget.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    super.initState();

    context.read<FavouriteBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        actions: const [DeleteButtonWidget()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (BuildContext context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case ListStatus.failure:
                return const Center(child: Text('error'));
              case ListStatus.success:
                return ListView.builder(
                    itemCount: state.favouriteList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Checkbox(
                            value: state.tempFavouriteList
                                    .contains(state.favouriteList[index])
                                ? true
                                : false,
                            onChanged: (bool? value) {
                              FavouriteItemModel item =
                                  state.favouriteList[index];
                              if (value!) {
                                context
                                    .read<FavouriteBloc>()
                                    .add(SelectItem(item: item));
                              } else {
                                context
                                    .read<FavouriteBloc>()
                                    .add(UnSelectItem(item: item));
                              }
                            },
                          ),
                          title: Text(
                            state.favouriteList[index].value,
                            style: TextStyle(
                                decoration: state.tempFavouriteList
                                        .contains(state.favouriteList[index])
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                color: state.tempFavouriteList
                                        .contains(state.favouriteList[index])
                                    ? Colors.red
                                    : Colors.white),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              FavouriteItemModel item =
                                  state.favouriteList[index];

                              context.read<FavouriteBloc>().add(FavouriteItem(
                                  item: FavouriteItemModel(
                                      id: item.id,
                                      isFavourite:
                                          item.isFavourite ? false : true,
                                      value: item.value)));
                            },
                            icon: Icon(state.favouriteList[index].isFavourite
                                ? Icons.favorite
                                : Icons.favorite_outline),
                          ),
                        ),
                      );
                    });
            }
          },
        ),
      ),
    );
  }
}
