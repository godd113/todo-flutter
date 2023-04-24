import 'package:flutter/material.dart';
import 'package:todo/models/modelIcon.dart';
import 'package:todo/models/modelToDoCard.dart';
import 'package:todo/modules/module_center.dart';
import 'package:todo/pages/todo_list.dart';

class CardToDo extends StatefulWidget {
  ModelToDoCard oModelCard;
  final int indexOfObject;
  final List<ModelIcon> allIcons = ModuleCenter.listIcons;
  CardToDo({super.key, required this.oModelCard, required this.indexOfObject});

  @override
  State<CardToDo> createState() => _CardToDoState();
}

class _CardToDoState extends State<CardToDo> {
  @override
  Widget build(BuildContext context) {
    final double screenDeviceWidth = MediaQuery.of(context).size.width;
    ModelIcon imgIcon = widget.allIcons
        .firstWhere((icon) => icon.iconID == widget.oModelCard.iconID);
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(12),
        width: screenDeviceWidth - 30,
        decoration: BoxDecoration(
            color: widget.oModelCard.color,
            borderRadius: BorderRadius.circular(10)),
        child: Column(children: [
          Row(
            children: [
              Icon(
                imgIcon.icon,
                color: ModuleCenter.darken(widget.oModelCard.color),
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                width: (screenDeviceWidth - 105),
                child: Text(
                  widget.oModelCard.todoCardName,
                  style: TextStyle(
                      color: ModuleCenter.darken(widget.oModelCard.color),
                      fontSize: 25,
                      fontFamily: 'Kanit'),
                ),
              ),
              Container(
                child: Icon(Icons.more_horiz),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                '${widget.oModelCard.todoCardTaskNum} Tasks',
                style: TextStyle(
                    color: ModuleCenter.darken(widget.oModelCard.color),
                    fontSize: 15,
                    fontFamily: 'Kanit'),
              )
            ],
          )
        ]),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ToDoList(
                  indexObject: widget.indexOfObject,
                  parentAction: (value) {
                    setState(() {
                      widget.oModelCard.todoCardTaskNum = value;
                    });
                  },
                  oModuleCard:
                      ModuleCenter.listCards[widget.indexOfObject].oModelCard)),
        );
      },
    );
  }
}
