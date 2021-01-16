class Tasks {
  String imgAssetPath;
  String day;
  String task;
  String time;
  String month;
  Tasks({this.imgAssetPath, this.day, this.month, this.task, this.time});
}

List<Tasks> getTasks() {
  List<Tasks> specialities = new List<Tasks>();
  Tasks specialityModel = new Tasks();

  //1
  specialityModel.day = "27";
  specialityModel.month = "Feb";
  specialityModel.task = "Design Presentation for Group 5";
  specialityModel.imgAssetPath = "assets/one.jpg";
  specialityModel.time = "2:30 pm";
  specialities.add(specialityModel);

  specialityModel = new Tasks();

  //2
  specialityModel.day = "27";
  specialityModel.month = "Mar";
  specialityModel.task = "Toc  series 3 exam ";
  specialityModel.imgAssetPath = "assets/two.jpg";
  specialityModel.time = "1:00 pm";
  specialities.add(specialityModel);

  specialityModel = new Tasks();

  //3
  specialityModel.day = "28";
  specialityModel.month = "Jan";
  specialityModel.task = "Hackathon Registration";
  specialityModel.imgAssetPath = "assets/three.jpg";
  specialityModel.time = "5:00 am";
  specialities.add(specialityModel);

  specialityModel = new Tasks();
//4
  specialityModel.day = "12";
  specialityModel.month = "Aug";
  specialityModel.task = "Design Presentation for Group 3";
  specialityModel.imgAssetPath = "assets/one.jpg";
  specialityModel.time = "2:30 pm";
  specialities.add(specialityModel);

  specialityModel = new Tasks();
//5
  specialityModel.day = "8";
  specialityModel.month = "Apr";
  specialityModel.task = "Design Presentation for Group 2";
  specialityModel.imgAssetPath = "assets/two.jpg";
  specialityModel.time = "2:30 pm";
  specialities.add(specialityModel);

  specialityModel = new Tasks();

//6
  specialityModel.day = "2";
  specialityModel.month = "Dec";
  specialityModel.task = "Design Presentation for Group 4";
  specialityModel.imgAssetPath = "assets/three.jpg";
  specialityModel.time = "2:30 pm";
  specialities.add(specialityModel);

  specialityModel = new Tasks();

  return specialities;
}
