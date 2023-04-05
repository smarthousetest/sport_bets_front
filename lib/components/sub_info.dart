import 'package:bet_app/screens/profile_cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';

class SubInfo extends StatefulWidget {
  StratProfileState profileState;

  SubInfo({super.key, required this.profileState});

  @override
  State<SubInfo> createState() => _SubInfoState();
}

class _SubInfoState extends State<SubInfo> {
  CancelableOperation? cancelableLoop;

  bool isSubActive = false;
  @override
  void dispose() {
    cancelableLoop?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cancelableLoop == null) {
      cancelableLoop = CancelableOperation.fromFuture(
        startLoop(widget.profileState.userModel?.subscriptionExpiresUtc),
        onCancel: () => {debugPrint('onCancel')},
      );
    }

    return Row(
      children: [
        Text("Account status:",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white)),
        Row(
          children: [
            widget.profileState.userModel?.subscriptionExpiresUtc == null
                ? Image.asset(
                    "assets/red.png",
                    width: 20,
                    height: 20,
                  )
                : Image.asset(
                    "assets/activate.png",
                    width: 20,
                    height: 20,
                  ),
            widget.profileState.userModel?.subscriptionExpiresUtc == null
                ? Text("Подписка\nне активна",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white))
                : Text(
                    "${widget.profileState.userModel!.subscriptionExpiresUtc!}",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
          ],
        )
      ],
    );
  }

  Future<void> startLoop(String? date) async {
    while (true) {
      var activeSub = checkActivSub(date);
      if (isSubActive != activeSub) {
        setState(() {
          isSubActive = activeSub;
        });
      }
      print("sub $activeSub");
      await Future.delayed(Duration(seconds: 2));
    }
  }

  bool checkActivSub(String? date) {
    if (date == null) {
      return false;
    }
    return DateTime.parse(date).isAfter(DateTime.now());
  }
}
