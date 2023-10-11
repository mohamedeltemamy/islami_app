import 'package:flutter/material.dart';
import 'package:islami_app/tabs/ahadeth.dart';
import 'package:islami_app/theme_data.dart';

class Hadeth_Details extends StatefulWidget {
  static const String routeName = "Hadeth Details";

  @override
  State<Hadeth_Details> createState() => HadethDetails();
}

class HadethDetails extends State<Hadeth_Details> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethContent;

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
          args.title,
          style: Theme.of(context).textTheme.bodyMedium,
        )),
        body: Card(
            elevation: 1,
            margin: EdgeInsets.all(14),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: MyThemeData.primary)),
            child: Text(
              args.content,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}
