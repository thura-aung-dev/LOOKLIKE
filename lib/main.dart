import 'dart:math';
import 'package:flutter/material.dart';
import 'package:week_3/Status.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
  ));
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int rng;
  String imageName = "question";
  String selectedGender = "male";

  List imageMaleNames = [
    "EdSheeran",
    "BaSai",
    "KeanuReeves",
    "RobertPattinson",
    "RyanReynolds",
    "BenAffleck",
    "TheRock"
  ];
  List imageFeMaleNames = [
    "BAEYOONYOUNG",
    "FUMINOKIMURA",
    "IRENEKIM",
    "JUNHASEGAWA",
    "KWAKJIYOUNG",
    "LEESUNGKYUNGAKABIBLEE",
    "SOOJOOPARK"
  ];
 List imageOtherNames = [
    "cat",
    "dog",
    "duck"
  ];
  Random random = Random();
  void pickRandomImage() {
    if (selectedGender == Status.male.toString()) {
      rng = random.nextInt(imageMaleNames.length);
      setState(() {
        imageName = imageMaleNames[rng];
      });
      print(imageName);
    } else  if (selectedGender == Status.female.toString()) {
      rng = random.nextInt(imageFeMaleNames.length);
      setState(() {
        imageName = imageFeMaleNames[rng];
      });
      print(imageName);
    }else  if (selectedGender == Status.other.toString()){
rng = random.nextInt(imageOtherNames.length);
      setState(() {
        imageName = imageOtherNames[rng];
      });
      print("Reach"+imageName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdddddd),
      appBar: AppBar(
        backgroundColor: Color(0xff30475e),
        centerTitle: true,
        title: Text(
          "Look Like",
          style: TextStyle(color: Color(0xffdddddd)),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 15),
              alignment: Alignment.center,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    genderButton(
                      gender: "MALE",
                      color: selectedGender == Status.male.toString()
                          ? Colors.lightBlueAccent
                          : Colors.grey,
                      onTap: () {
                        setState(() {
                          selectedGender = Status.male.toString();
                        });
                      },
                    ),
                    genderButton(
                      gender: "FEMALE",
                      color: selectedGender == Status.female.toString()
                          ? Colors.lightBlueAccent
                          : Colors.grey,
                      onTap: () {
                        setState(() {
                          selectedGender = Status.female.toString();
                        });
                      },
                    ),
                    genderButton(
                      gender: "OTHER",
                      color: selectedGender == Status.other.toString()
                          ? Colors.lightBlueAccent
                          : Colors.grey,
                      onTap: () {
                        setState(() {
                          selectedGender = Status.other.toString();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 35),
              child: Text(
                "Which celebrity do you look like?",
                style: TextStyle(color: Color(0xff30475e), fontSize: 25),
              ),
            ),
          ),
          Container(
            height: 300,
            width: 250,
            child: Image.asset('images/$imageName.png'),
          ),
          rng == null
              ? Container()
              : Text(
                  "You Look Like " + imageName+ ".",
                  style: TextStyle(color: Color(0xff30475e), fontSize: 20),
                ),
          SizedBox(
            height: 80,
          ),
          InkWell(
            splashColor: Color(0xfff05454),
            onTap: () {
              pickRandomImage();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xff30475e),
              ),
              height: 55,
              width: 250,
              child: Center(
                  child: Text(
                "Let's Find Out",
                style: TextStyle(fontSize: 18, color: Color(0xffdddddd)),
              )),
            ),
          )
        ],
      ),
    );
  }
}

class genderButton extends StatelessWidget {
  final String gender;
  final Function onTap;
  Color color;

  genderButton({Key key, this.gender, this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: color,
        ),
        child: Center(
            child: Text(
          gender,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
