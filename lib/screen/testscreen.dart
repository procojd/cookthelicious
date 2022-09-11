import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onboarding_screen/constant.dart';
import 'package:onboarding_screen/model/addrecipemodel.dart';
import 'package:onboarding_screen/main.dart';

class test extends StatefulWidget {


  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Box<Add>>(
        valueListenable: Hive.box<Add>("addrec").listenable(),
        builder: (context, box,_) {
          return Column(
            children: [
              Container(
                child: Text("hello"),
              ),
              Expanded(child: ListView.builder(
                itemCount: box.values.length,
                itemBuilder: ((context, index) {
                Add currentrecipe = box.getAt(index)!;
                return cardlist(recipe:currentrecipe,index: index,);
              })))
            ],
          );
        },
      ),
    );
  }
}

class cardlist extends StatefulWidget {
  @override
  Add recipe;

  int index;
  cardlist({required this.index, required this.recipe});
  State<cardlist> createState() => _cardlistState();
}

class _cardlistState extends State<cardlist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.recipe.title!),
    );
  }
}
