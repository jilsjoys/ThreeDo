import 'package:ThreeDo/list.dart';
import 'package:ThreeDo/listings.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'styles.dart';
import 'widgets/expanded_section.dart';
import 'package:intl/intl.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isExpanded = false;
  CalendarController _calendarController;

  List<Tasks> tasks;

  void _toogleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();

    tasks = getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  backgroundColor: Colors.white,
        body: ListView(
      children: <Widget>[
        Stack(
          alignment: Alignment.topCenter,
          overflow: Overflow.visible,
          children: <Widget>[
            buildMainHeader(),
            buildToggleButton(),
          ],
        ),
        buildExpandableChildren(),
        SizedBox(
          height: 30,
        ),
        buildUpcomingEventsTitle()
      ],
    ));
  }

  Widget buildUpcomingEventsTitle() {
    return Container(
      //padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          _buildHorizontalDatesCalender(),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '   Tasks',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    //TODO implement navigator.push method,
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => Listings(),
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFF21243C),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 7.0),
                        child: Text("View All",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 20,
          ),
          Container(
            height: 250,
            child: ListView.builder(
                itemCount: tasks.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SpecialistTile(
                    imgAssetPath: tasks[index].imgAssetPath,
                    day: tasks[index].day,
                    month: tasks[index].month,
                    task: tasks[index].task,
                    time: tasks[index].time,
                  );
                }),
          ),
          SizedBox(
            height: 10,
          )
//taskss
        ],
      ),
    );
  }

  DateTime selectedDate = DateTime.now();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd ');

  Widget buildExpandableChildren() {
    return Container(
      padding: EdgeInsets.only(top: 40, left: 7, right: 7),
      child: ExpandedSection(
        expand: _isExpanded,
        child: Neumorphic(
          style: NeumorphicStyle(
              depth: -10,
              shadowLightColorEmboss: Colors.blue[100],
              //  shadowDarkColorEmboss: Colors.pink[100],
              color: Colors.white,
              //  border: NeumorphicBorder(width: 2),
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(25)),
              intensity: 0.7,
              disableDepth: false,
              shape: NeumorphicShape.concave),
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(30),
                // color: Colors.white,
                ),
            width: 350,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        '  Add New Task',
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 3,
                                color: Colors.grey[500].withOpacity(1.0),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 50,
                        width: 300,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.pink[50],
                                offset: Offset(-2.0, -2.0),
                                blurRadius: 15.0,
                                spreadRadius: 1.0),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "       Enter the task....",
                              hintStyle: TextStyle(color: Colors.grey[700]),
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)),
                            color: Colors.white,
                            child: Text('Date'),
                            onPressed: () async {
                              final selectedDate =
                                  await _selectDateTime(context);
                              if (selectedDate == null) return;
                              Text(selectedDate.toString());

                              setState(() {
                                this.selectedDate = DateTime(
                                  selectedDate.day,
                                  selectedDate.month,
                                  selectedDate.year,
                                  selectedDate.day,
                                );
                              });
                            },
                          ),
                          SizedBox(
                            width: 300,
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)),
                            color: Colors.white,
                            child: Text('Time'),
                            onPressed: () async {
                              final selectedTime = await _selectTime(context);
                              if (selectedTime == null) return;
                              print(selectedTime);
                              setState(() {
                                this.selectedDate = DateTime(
                                  selectedDate.day,
                                  selectedDate.month,
                                  selectedDate.year,
                                  selectedDate.day,
                                  selectedTime.hour,
                                  selectedTime.minute,
                                );
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 90,
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.blue[300],
                  child: Text(
                    '  ADD  ',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  onPressed: () {
                    _toogleExpand();
                  },
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalDatesCalender() {
    return TableCalendar(
      calendarController: _calendarController,
      initialCalendarFormat: CalendarFormat.week,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableCalendarFormats: {CalendarFormat.week: ''},
      calendarStyle: CalendarStyle(
        selectedColor: searchBarColor,
      ),
    );
  }

  Positioned buildToggleButton() {
    return Positioned(
      bottom: -30,
      child: InkResponse(
        onTap: _toogleExpand,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 10,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 6.0,
                ),
              ]),
          child: Center(
            child: Icon(
              _isExpanded ? Icons.close_outlined : Icons.add,
              size: 32,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Container buildMainHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 66, 24, 24),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/two.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 0),
          SizedBox(height: 12),
          buildSearchBar(),
        ],
      ),
    );
  }

  Container buildSearchBar() {
    return Container(
      height: 60,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: searchBarDecoration,
      child: Center(
        child: TextField(
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.search, color: Colors.white, size: 18),
              border: InputBorder.none,
              hintText: 'Search for a task ... ',
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              )),
        ),
      ),
    );
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
    return Container(
        width: 150,
        height: 150,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imgAssetPath),
            fit: BoxFit.cover,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 20),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Icon(
                    Icons.access_time,
                    color: Colors.black54,
                    size: 17,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
                SizedBox(
                  width: 5,
                ),
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.black54,
                    size: 25,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  month + " " + day,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  task,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ],
        ));
  }
}

Future<TimeOfDay> _selectTime(BuildContext context) {
  final now = DateTime.now();

  return showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
  );
}

Future<DateTime> _selectDateTime(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(seconds: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
