import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pragma_cats/features/cat_breeds/domain/usecases/get_cat_breeds_usecase.dart';
import 'package:pragma_cats/features/cat_breeds/presentation/bloc/cat_breeds_bloc.dart';
import 'package:pragma_cats/features/cat_breeds/presentation/bloc/cat_breeds_event.dart';
import 'package:pragma_cats/features/cat_breeds/presentation/views/cat_breeds_view.dart';

class CatBreedsPage extends StatelessWidget {
  const CatBreedsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CatBreedsBloc(GetIt.I<GetCatBreedsUseCase>())..add(LoadCatBreeds()),
      child: const CatBreedsView(),
    );
  }
}
