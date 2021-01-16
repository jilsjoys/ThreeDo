import 'package:ThreeDo/add_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ThreeDo/list.dart';

class Listings extends StatefulWidget {
  @override
  _ListingsState createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  List<Tasks> tasks;

  @override
  void initState() {
    super.initState();

    tasks = getTasks();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                  backgroundColor: Colors.transparent,
                  floating: true,
                  elevation: 0,
                  leading: BackButton(color: Colors.black),
                  flexibleSpace: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 48,
                          width: 300,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blue[100],
                                  offset: Offset(-2.0, -2.0),
                                  blurRadius: 20.0,
                                  spreadRadius: 1.0),
                            ],
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                hintText: "Search Task",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ])),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(padding: EdgeInsets.only(top: 10)),
                    ListView.builder(
                        itemCount: tasks.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return SpecialistTile(
                            imgAssetPath: tasks[index].imgAssetPath,
                            day: tasks[index].day,
                            month: tasks[index].month,
                            task: tasks[index].task,
                            time: tasks[index].time,
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 30,
          bottom: 40,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.add,
              color: Colors.grey[600],
              size: 34,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => leadDialog);
            },
          ),
        ),
      ],
    ));
  }
}

class SpecialistTile extends StatelessWidget {
  final String imgAssetPath;
  final String day;
  final String month;
  final String task;
  final String time;
  SpecialistTile(
      {@required this.imgAssetPath,
      @required this.day,
      @required this.month,
      @required this.task,
      @required this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 7, right: 7),
          child: Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 100,
                margin: EdgeInsets.only(right: 20),
                child: Column(
                  children: <Widget>[
                    Text(
                      day,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      month,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                children: <Widget>[
                  Container(
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(imgAssetPath),
                            fit: BoxFit.cover)),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(colors: [
                            Colors.black.withOpacity(.4),
                            Colors.black.withOpacity(.1),
                          ])),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            task,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                color: Colors.white,
                                size: 18,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                time,
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.black54,
                                  size: 20,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
