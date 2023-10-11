import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class sebhaTap extends StatefulWidget {
  @override
  State<sebhaTap> createState() => _sebhaState();
}

class _sebhaState extends State<sebhaTap> {
  int counter = 0;
  String text = "سبحان الله";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(alignment: Alignment.topCenter, children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 82,
                  ),
                  child: Image.asset("assets/images/body_of_seb7a.png"),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 65),
                    child: Image.asset("assets/images/head_of_seb7a.png")),
              ]),
            ),
            const SizedBox(height: 25),
            Text(
              "عدد التسبيحات",
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 25),
            Container(
              alignment: Alignment.center,
              height: 81,
              width: 69,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: const Color(0xFFBC9A68).withOpacity(0.5),
              ),
              child: Text(
                "$counter",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: theme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                setState(() {
                  if (counter < 33) {
                    counter++;
                    text = "سبحان الله";
                  } else if (counter < 66) {
                    counter++;
                    text = "الحمد لله";
                  } else if (counter < 99) {
                    counter++;
                    text = "لا إلهَ إلاَّ اللَّه ";
                  } else if (counter < 132) {
                    counter++;
                    text = "الله وأكبر ";
                  } else {
                    counter = 0;
                  }
                });
              },
              child: Text(
                text,
                style: GoogleFonts.elMessiri(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  valueDetalis(String value) {
    setState(() {
      value = text;
    });
  }
}
