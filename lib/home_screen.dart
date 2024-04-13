import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> list = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  int counter = 0;
  int counterX = 0;
  int counterO = 0;
  bool xBool = true;
  bool winBool = false;
  String winIs = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      if (xBool) {
                        if (list[index].isEmpty) {
                          setState(() {
                            list[index] = "x";
                            counterX += 1;
                            xBool = false;
                          });
                        }
                        winFun("x");
                      } else if (!xBool) {
                        if (list[index].isEmpty) {
                          setState(() {
                            list[index] = "o";
                            counterO += 1;
                            xBool = true;
                            winFun("o");
                          });
                        }
                      }
                      if(counterX==5&&counterO==4&&winIs.isEmpty){
                        print("$counterX $counterO");
                        showAlertDialog(title:"No Winner",msg: "Draw");
                      }
                      // print("$counterX $counterO ${winIs.isEmpty}");
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.green,
                      child: Center(
                          child: Text(
                        list[index],
                        style: const TextStyle(
                          fontSize: 33,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.symmetric(horizontal: 80),
              width: double.infinity,
              height: 50,
              child: Center(
                  child: FittedBox(
                child: Row(
                  children: [
                    const Text(
                      "Winner is ",
                      style: TextStyle(
                        fontSize: 33,
                        color: Colors.white,
                      ),
                    ),
                    winIs.isEmpty
                        ? const SizedBox()
                        : Container(
                            color: Colors.redAccent,
                            child: Text(
                              textAlign: TextAlign.center,
                              "$winIs ",
                              style: const TextStyle(
                                  fontSize: 35, color: Colors.white),
                            ),
                          ),
                  ],
                ),
              )),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                resetFun();
              },
              child: const Text(
                "Reset",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }

  winFun(String ch) {
    if (list[0] == ch && list[1] == ch && list[2] == ch) {
      setState(() {
        winIs = ch;
        showAlertDialog(msg: winIs);
      });
    }
    if (list[3] == ch && list[4] == ch && list[5] == ch) {
      setState(() {
        winIs = ch;
        showAlertDialog(msg: winIs);
      });
    }
    if (list[6] == ch && list[7] == ch && list[8] == ch) {
      setState(() {
        winIs = ch;
        showAlertDialog(msg: winIs);
      });
    }
    if (list[0] == ch && list[3] == ch && list[6] == ch) {
      setState(() {
        winIs = ch;
        showAlertDialog(msg: winIs);
      });
    }
    if (list[1] == ch && list[4] == ch && list[7] == ch) {
      setState(() {
        winIs = ch;
        showAlertDialog(msg: winIs);
      });
    }
    if (list[2] == ch && list[5] == ch && list[8] == ch) {
      setState(() {
        winIs = ch;
        showAlertDialog(msg: winIs);
      });
    }
    if (list[0] == ch && list[4] == ch && list[8] == ch) {
      setState(() {
        winIs = ch;
        showAlertDialog(msg: winIs);
      });
    }
    if (list[2] == ch && list[4] == ch && list[6] == ch) {
      setState(() {
        winIs = ch;
        showAlertDialog(msg: winIs);
      });
    }


  }

  resetFun() {
    setState(() {
      list = [
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
      ];
      xBool = true;
      winIs = '';
      counterX=0;
      counterO=0;
    });
  }

  showAlertDialog({String title="Winner is ", String msg=""}) {
    // set up the button
    Widget okButton = TextButton(
      child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(15)),
          child: const Text(
            "Reset",
            style: TextStyle(color: Colors.white, fontSize: 24),
          )),
      onPressed: () {
        resetFun();
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.blueAccent[100],
      title:  Text(
        // "Winner is ",
        title,
        style: const TextStyle(
          fontSize: 33,
          color: Colors.white,
        ),
      ),
      content: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.symmetric(horizontal: 80),
        width: double.infinity,
        height: 50,
        child: Center(
            child: Text(
          textAlign: TextAlign.center,
          // "$winIs ",
              msg,
          style: const TextStyle(fontSize: 35, color: Colors.white),
        )),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
