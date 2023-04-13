import 'package:bet_app/components/cards_model.dart';
import 'package:bet_app/const.dart';
import 'package:bet_app/models/bet_model.dart';
import 'package:bet_app/screens/bets_screen/cubit/bet_cubit.dart';
import 'package:bet_app/screens/bets_screen/cubit/bet_state.dart';
import 'package:bet_app/screens/bets_screen/tap_bets_screen.dart';
import 'package:bet_app/server/api/api.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BetsScreen extends StatefulWidget {
  const BetsScreen({super.key});

  @override
  State<BetsScreen> createState() => _BetsScreenState();
}

class _BetsScreenState extends State<BetsScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<BetCubit>().getBets();
    return Scaffold(
        backgroundColor: mainColor,
        body: BlocBuilder<BetCubit, BetCubitState>(builder: (context, state) {
          return _floatingTabBar();
        }));
  }

  _onRefresh(BuildContext context) {
    context.read<BetCubit>().getBets();
  }

  Widget _floatingTabBar() {
    return ContainedTabBarView(
      tabs: [
        Text('Активные'),
        Text('Завершенные'),
      ],
      views: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
          child:
              BlocBuilder<BetCubit, BetCubitState>(builder: (context, state) {
            if (state is BetLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is BetLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  await context.read<BetCubit>().getBets();
                },
                child: state.betModel?.unfinishedAdvices?.length == null
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "Чтобы видеть активные стаки,\nследует активировать подписку",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    : state.betModel?.unfinishedAdvices?.length != 0
                        ? GridView.builder(
                            itemCount:
                                state.betModel?.unfinishedAdvices?.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) {
                              List<BetModel> list =
                                  state.betModel!.unfinishedAdvices!;
                              return GestureDetector(
                                  onTap: () {
                                    list[index].matchBeginning;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => TapBet(
                                                  teamFirst:
                                                      list[index].teamFirst,
                                                  teamSecond:
                                                      list[index].teamSecond,
                                                  bet: list[index].bet,
                                                  bettingOdds: list[index]
                                                      .bettingOdds
                                                      .toString(),
                                                  sportType:
                                                      list[index].sportType,
                                                  league: list[index].league,
                                                  comment: list[index].comment,
                                                  probability: list[index]
                                                      .probability
                                                      .toString(),
                                                  bettingId: list[index]
                                                      .bettingAdviceId!,
                                                  betSuccess:
                                                      list[index].betSuccessful,
                                                  country: list[index].country,
                                                  dateTime: list[index]
                                                      .matchBeginning,
                                                )));
                                  },
                                  child: CardModel(
                                    teamFirst: list[index].teamFirst!,
                                    teamSecond: list[index].teamSecond!,
                                    index: index,
                                    id: list[index].bettingAdviceId!,
                                    betSuccessful: list[index].betSuccessful,
                                  ));
                            },
                          )
                        : Center(
                            child: Text(
                              "Активных ставок нет",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
              );
            } else if (state is BetIsEmpty) {
              return Center(
                child: Text("Is Empty"),
              );
            } else if (state is DemoBetState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Для получения доступа к ставкам - авторизуйтесь",
                    style: TextStyle(color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Color(0xff1cfffd), width: 3)),
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.transparent)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Авторизация",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  )
                ],
              );
            }
            return Text("data");
          }),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
          child:
              BlocBuilder<BetCubit, BetCubitState>(builder: (context, state) {
            if (state is BetLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is BetLoaded) {
              return RefreshIndicator(
                  onRefresh: () async {
                    await context.read<BetCubit>().getBets();
                  },
                  child: state.betModel?.history?.length != 0
                      ? GridView.builder(
                          itemCount: state.betModel!.history?.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            List<BetModel> list = state.betModel!.history!;
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TapBet(
                                                teamFirst:
                                                    list[index].teamFirst,
                                                teamSecond:
                                                    list[index].teamSecond,
                                                bet: list[index].bet,
                                                bettingOdds: list[index]
                                                    .bettingOdds
                                                    .toString(),
                                                sportType:
                                                    list[index].sportType,
                                                league: list[index].league,
                                                comment: list[index].comment,
                                                probability: list[index]
                                                    .probability
                                                    .toString(),
                                                bettingId: list[index]
                                                    .bettingAdviceId!,
                                                betSuccess:
                                                    list[index].betSuccessful,
                                                country: list[index].country,
                                                dateTime:
                                                    list[index].matchBeginning,
                                              )));
                                },
                                child: CardModel(
                                  teamFirst: list[index].teamFirst!,
                                  teamSecond: list[index].teamSecond!,
                                  index: index,
                                  id: list[index].bettingAdviceId!,
                                  betSuccessful: list[index].betSuccessful,
                                ));
                          },
                        )
                      : Center(
                          child: Text(
                            "История пуста",
                            style: TextStyle(color: Colors.white),
                          ),
                        ));
            }
            if (state is BetIsEmpty) {
              return Center(
                child: Text("Is Emty"),
              );
            }
            return Text("data");
          }),
        ),
      ],
      onChange: (index) => print(index),
    );
  }
}
