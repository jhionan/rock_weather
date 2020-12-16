import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_weather/core/navigation/navigation_config.dart';
import 'package:rock_weather/features/tour_home/bloc/tourbloc_bloc.dart';
import 'package:rock_weather/features/tour_home/data/tour_model.dart';
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
                List<TourModel> citiesWeather;
                if (state is TourFetched) {
                  citiesWeather = state.citiesWeather;
                }
                return Column(
                  children: [
                    SearchComponent(
                      onChanged: (query) {
                        context.read<TourBloc>().add(SearchTour(query));
                      },
                      onSubmitted: (query) {
                        context.read<TourBloc>().add(SearchTour(query, true));
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    if (citiesWeather != null)
                      Expanded(
                        child: ListView.separated(
                          itemCount: citiesWeather.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    AppRoutes.detail,
                                    arguments: citiesWeather[index]);
                              },
                              child: TourItem(
                                cityWeather: citiesWeather[index],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            height: 4,
                          ),
                        ),
                      ),
                    if (citiesWeather != null && citiesWeather.isEmpty)
                      Center(child: Text('Não encontramos esta cidade')),
                    if (citiesWeather == null)
                      Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
