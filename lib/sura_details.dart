import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/tabs/sura_model.dart';
import 'package:islami_app/theme_data.dart';

class Sura_Details extends StatefulWidget {
  static const String routeName = "Sura Details";

  @override
  State<Sura_Details> createState() => Sura_DetailsState();
}

class Sura_DetailsState extends State<Sura_Details> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
            title: Text(
          args.name,
          style: Theme.of(context).textTheme.bodyLarge,
        )),
        body: Card(
          elevation: 1,
          margin: EdgeInsets.all(14),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: MyThemeData.primary)),
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              indent: 40,
              endIndent: 40,
            ),
            itemBuilder: (context, index) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  "${verses[index]}(${index + 1})",
                  textAlign: TextAlign.center,
                ),
              );
            },
            itemCount: verses.length,
          ),
        ),
      ),
    );
  }

  void loadFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");

    List<String> lines = sura.split("\n");
    print(lines);
    verses = lines;
    setState(() {});
  }
}
