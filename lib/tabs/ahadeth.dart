import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/tabs/ahadeth_details.dart';
import 'package:islami_app/theme_data.dart';

class ahadethTap extends StatefulWidget {
  @override
  State<ahadethTap> createState() => _ahadethTapState();
}

class _ahadethTapState extends State<ahadethTap> {
  List<HadethContent> allHadethContent = [];

  @override
  Widget build(BuildContext context) {
    if (allHadethContent.isEmpty) {
      readFile();
    }

    var theme = Theme.of(context);
    return Column(
      children: [
        Image.asset("assets/images/ahadeth_image.png"),
        Divider(
          thickness: 2,
          indent: 10,
          endIndent: 10,
          color: MyThemeData.primary,
          height: 10,
        ),
        Text(
          "الاحاديث ",
          style: theme.textTheme.bodyLarge,
        ),
        Divider(
          thickness: 2,
          indent: 10,
          endIndent: 10,
          color: MyThemeData.primary,
          height: 10,
        ),
        Expanded(
            child: ListView.separated(
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Hadeth_Details.routeName,
                  arguments: HadethContent(
                      title: allHadethContent[index].title,
                      content: allHadethContent[index].content));
            },
            child: Text(allHadethContent[index].title,
                textAlign: TextAlign.center),
          ),
          itemCount: allHadethContent.length,
          separatorBuilder: (context, index) => Divider(
            thickness: 2,
            indent: 40,
            endIndent: 40,
            color: MyThemeData.primary,
            height: 10,
          ),
        ))
      ],
    );
  }

  readFile() async {
    String text = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allHadeth = text.split("#");

    for (int i = 0; i < allHadeth.length; i++) {
      String singleHadeth = allHadeth[i].trim();
      int indexOfFirstLine = singleHadeth.indexOf("\n");
      String title = singleHadeth.substring(0, indexOfFirstLine);
      String content = singleHadeth.substring(indexOfFirstLine + 1);
      HadethContent hadethContent =
          HadethContent(title: title, content: content);
      allHadethContent.add(hadethContent);

      setState(() {});
      print(title);
    }
  }
}

class HadethContent {
  final String title;
  final String content;

  HadethContent({required this.title, required this.content});
}
