import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_weather/core/navigation/navigation_config.dart';
import 'package:rock_weather/features/tour_home/bloc/tourbloc_bloc.dart';
import 'package:rock_weather/features/tour_home/view/search_component.dart';
import 'package:rock_weather/features/tour_home/view/tour_item.dart';

class TourHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<TourBloc, TourState>(
            buildWhen: (old, next) => true,
            builder: (context, state) {
              if (state is! TourFetched) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                TourFetched tourState = state;
                return Column(
                  children: [
                    SearchComponent(),
                    SizedBox(height: 16,),
                    Expanded(
                      child: ListView.separated(
                        itemCount: tourState.citiesWeather.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(AppRoutes.detail,
                                  arguments: tourState.citiesWeather[index]);
                            },
                            child: TourItem(
                              cityWeather: tourState.citiesWeather[index],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          height: 4,
                        ),
                      ),
                    )
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
