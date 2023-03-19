import 'package:bet_app/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Уважаемые пользователи,',
              style: GoogleFonts.kanit(color: Colors.white, fontSize: 20),
            ),
            Text(
              'Мы рады что вы ставите вместе с нами. Если \nу вас возникнут вопросы, обращайтесь на почту, и мы ответим вам в ближайшее время',
              style: GoogleFonts.kanit(color: Colors.white, fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            SelectableText(
              'darkbladebets@gmail.com',
              style: GoogleFonts.kanit(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
