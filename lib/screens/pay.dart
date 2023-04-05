import 'package:bet_app/components/banner.dart';
import 'package:bet_app/components/credit_card.dart';
import 'package:bet_app/components/sub_card_model.dart';
import 'package:bet_app/const.dart';
import 'package:bet_app/payment.dart';
import 'package:bet_app/screens/auth/auth_cubit.dart';
import 'package:bet_app/screens/auth/auth_state.dart';
import 'package:bet_app/screens/bets_screen/cubit/bet_state.dart';
import 'package:bet_app/screens/subscription_screen/sub_cubit.dart';
import 'package:bet_app/screens/subscription_screen/sub_state.dart';
import 'package:bet_app/screens/subscription_screen/subscription_admin.dart';
import 'package:bet_app/screens/webView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yookassa_payments_flutter/yookassa_payments_flutter.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isClicked = false;
  int clickIndex = 0;
  @override
  Widget build(BuildContext context) {
    context.read<SubCubit>().getSub();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'Оплата подписки',
            style: GoogleFonts.fugazOne(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        backgroundColor: mainColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
              if (state is NotAuthState) {
                return state.isAdmin
                    ? Align(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SubScreenAdmin(),
                                  ));
                            },
                            child: Text('Добавить подписку')),
                      )
                    : Container();
              } else {
                return Container();
              }
            }),
            BlocBuilder<SubCubit, SubState>(builder: (context, state) {
              if (state is SubLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is SubLoaded) {
                return SizedBox(
                  height: 150,
                  child: ListView.builder(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      shrinkWrap: true,
                      itemCount: state.subModel.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: GestureDetector(
                            onTap: () {
                              Payment payment = Payment();
                              payment.getToken(
                                  context,
                                  state.subModel[index].subscriptionInfoId!,
                                  state.subModel[index].subscriptionPrice!,
                                  state.subModel[index]
                                      .subscriptionDurationInDays!);

                              print(index);
                            },
                            child: SubCardModel(
                              days: state
                                  .subModel[index].subscriptionDurationInDays!,
                              price: state.subModel[index].subscriptionPrice!,
                              id: state.subModel[index].subscriptionInfoId!,
                              isClicked:
                                  clickIndex == index ? isClicked : false,
                            ),
                          ),
                        );
                      }),
                );
              }
              return Container();
            }),
            // Padding(
            //   padding: const EdgeInsets.only(top: 30),
            //   child: Container(
            //       height: 50,
            //       width: 150,
            //       child: ElevatedButton(
            //           style: ButtonStyle(
            //               side: MaterialStateBorderSide.resolveWith(
            //                   (states) => BorderSide(color: Colors.white)),
            //               backgroundColor:
            //                   MaterialStateProperty.all(Colors.transparent)),
            //           onPressed: () async {

            //           },
            //           child: Text("Оплатить"))),
            // )
          ],
        ));
  }
}
