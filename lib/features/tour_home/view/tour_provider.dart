import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riverpod/all.dart';
import 'package:rock_weather/core/api/base_api.dart';
import 'package:rock_weather/core/api/api_provider.dart';
import 'package:rock_weather/features/tour_home/bloc/tourbloc_bloc.dart';
import 'package:rock_weather/features/tour_home/data/tour_api.dart';
import 'package:rock_weather/features/tour_home/data/tour_datasouce.dart';
import 'package:rock_weather/features/tour_home/view/tour_home.dart';

class TourProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        ApiFactoryDelegate apiFactoryDelegate =
            () => ProviderContainer().read(apiProvider.future);
        return TourBloc(TourDataSource(TourApiImp(apiFactoryDelegate)));
      },
      child: TourHome(),
    );
  }
}
