import 'package:flutter/material.dart';
import 'package:tictactoe/alert_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_glow/flutter_glow.dart';



class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _scoreX = 0;
  int _scoreO = 0;
  bool _turnOfO =true;
  int _filledBoxes =0;

  final List<String> _xOrOList =[
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(

            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [

                Color(0XFF552586),
                Color(0XFF6A359C),
                Color(0XFF804FB3),
                Color(0XFF9969C7),
                Color(0XFFB589D6),
              ],
            ),
          ),
        ),
        elevation: 20,
        actions: [
          IconButton(onPressed: (){
            _clearBoard();
          }, icon: const Icon(Icons.refresh,color: Colors.white,))
        ],
        title: Text ('Tic Tac Toe', style:GoogleFonts.poppins(fontSize:25.0,
            fontWeight:FontWeight.bold,color: Colors.white60),
        ),
        ),
      body:Column(
        children:[
          const SizedBox(height:50),
        _buildPointsTable(),
          _buildGrid(),
          ]
      ),
    );
  }

  Widget _buildPointsTable(){
    var screenSize= MediaQuery.of(context).size;
    return Expanded(
        child:FittedBox(
          fit:BoxFit.scaleDown,
          child: Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Padding(
                    padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    if(_turnOfO==true)... [Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
             gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [

                    Color(0XFF552586),
                    Color(0XFF6A359C),
                    Color(0XFF804FB3),
                    Color(0XFF9969C7),
                    Color(0XFFB589D6),
                  ],
                ),),
                      child: Text('   Player O   ',style:GoogleFonts.poppins(fontSize:25.0,
                          fontWeight:FontWeight.bold,color: Colors.white),),
                    ),]else...[Text('   Player O   ',style:GoogleFonts.poppins(fontSize:25.0,
                        fontWeight:FontWeight.bold,color: Colors.white),),],
                    const SizedBox(height: 20),
                    Text(_scoreO.toString(),style:GoogleFonts.poppins(fontSize:25.0,
                        fontWeight:FontWeight.bold,color: Colors.white),
                    ),
                  ],
                ),),
                 SizedBox(width : screenSize.width/5,),
                Padding(padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    if(_turnOfO==false)... [Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(50.0),
                         gradient: const LinearGradient(
                           begin: Alignment.topLeft,
                           end: Alignment.bottomRight,
                           colors: [

                             Color(0XFF552586),
                             Color(0XFF6A359C),
                             Color(0XFF804FB3),
                             Color(0XFF9969C7),
                             Color(0XFFB589D6),
                           ],
                         ),),

                       child: Text('   Player X   ',style:GoogleFonts.poppins(fontSize:25.0,
                          fontWeight:FontWeight.bold,color: Colors.white),),
                     ),]else...[Text('   Player X   ',style:GoogleFonts.poppins(fontSize:25.0,
                        fontWeight:FontWeight.bold,color: Colors.white),),],
                    const SizedBox(height: 20),
                    Text(_scoreX.toString(),style:GoogleFonts.poppins(fontSize:25.0,
                        fontWeight:FontWeight.bold,color: Colors.white),
                    ),
                  ]
                ),),

              ]
            ),
          ),
        ));
  }

  Widget _buildGrid() {

    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: GridView.builder(
          shrinkWrap: true,
            //physics: NeverScrollableScrollPhysics(),
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              //childAspectRatio: 1.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              if(index==0){
              return GestureDetector(
                onTap: () {
                  _tapped(index);
                },
                child: Container(

                  decoration:
                  const BoxDecoration(border: Border(

                      right: BorderSide(width: 10.0, color: Color(0XFF804FB3)),
                  bottom: BorderSide(width: 10.0, color: Color(0XFF804FB3)),
                ),

                  ),
                  child: Center(
                    child: GlowText(
                      _xOrOList[index],
                      style:GoogleFonts.openSans(fontSize:70.0,
                          fontWeight:FontWeight.normal,color: _xOrOList[index] == 'x' ? Colors.pinkAccent : Colors.lightBlueAccent,),
                    ),
                  ),
                ),
              );}else if(index==1){
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(

                    decoration:
                    const BoxDecoration(border: Border(
                      right: BorderSide(width: 10.0, color: Color(0XFF804FB3)),
                      bottom: BorderSide(width: 10.0, color: Color(0XFF9969C7)),
                    ),),
                    child: Center(
                      child: GlowText(
                        _xOrOList[index],
                        style:GoogleFonts.openSans(fontSize:70.0,
                          fontWeight:FontWeight.normal,color: _xOrOList[index] == 'x' ? Colors.pinkAccent : Colors.lightBlueAccent,),
                      ),
                    ),
                  ),
                );
              }else if(index==2){
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(

                    decoration:
                    const BoxDecoration(border: Border(
                      bottom: BorderSide(width: 10.0, color: Color(0XFFB589D6)),
                    ),),
                    child: Center(
                      child: GlowText(
                        _xOrOList[index],
                        style:GoogleFonts.openSans(fontSize:70.0,
                          fontWeight:FontWeight.normal,color: _xOrOList[index] == 'x' ? Colors.pinkAccent : Colors.lightBlueAccent,),
                      ),
                    ),
                  ),
                );
              }else if(index==3){
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(

                    decoration:
                    const BoxDecoration(border: Border(
                      right: BorderSide(width: 10.0, color: Color(0XFF9969C7)),
                      bottom: BorderSide(width: 10.0, color: Color(0XFF804FB3)),
                    ),

                    ),
                    child: Center(
                      child: GlowText(
                        _xOrOList[index],
                        style:GoogleFonts.openSans(fontSize:70.0,
                          fontWeight:FontWeight.normal,color: _xOrOList[index] == 'x' ? Colors.pinkAccent : Colors.lightBlueAccent,),
                      ),
                    ),
                  ),
                );
              }else  if(index==4){
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(

                    decoration:
                    const BoxDecoration(border: Border(

                        right: BorderSide(width: 10.0, color: Color(0XFF9969C7)),
                        bottom: BorderSide(width: 10.0, color: Color(0XFF9969C7)),
                    ),

                    ),
                    child: Center(
                      child: GlowText(
                        _xOrOList[index],
                        style:GoogleFonts.openSans(fontSize:70.0,
                          fontWeight:FontWeight.normal,color: _xOrOList[index] == 'x' ? Colors.pinkAccent : Colors.lightBlueAccent,),
                      ),
                    ),
                  ),
                );}else if(index==5){
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(

                    decoration:
                    const BoxDecoration(border: Border(

                      bottom: BorderSide(width: 10.0, color: Color(0XFFB589D6)),
                    ),),
                    child: Center(
                      child: GlowText(
                        _xOrOList[index],
                        style:GoogleFonts.openSans(fontSize:70.0,
                          fontWeight:FontWeight.normal,color: _xOrOList[index] == 'x' ? Colors.pinkAccent : Colors.lightBlueAccent,),
                      ),
                    ),
                  ),
                );
              }else if(index==6){
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(

                    decoration:
                    const BoxDecoration(border: Border(
                      right: BorderSide(width: 10.0, color: Color(0XFFB589D6)),
                    ),),
                    child: Center(
                      child: GlowText(
                        _xOrOList[index],
                        style:GoogleFonts.openSans(fontSize:70.0,
                          fontWeight:FontWeight.normal,color: _xOrOList[index] == 'x' ? Colors.pinkAccent : Colors.lightBlueAccent,),
                      ),
                    ),
                  ),
                );
              }else if(index==7){
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(

                    decoration:
                    const BoxDecoration(border: Border(
                      right: BorderSide(width: 10.0, color: Color(0XFFB589D6)),

                    ),

                    ),
                    child: Center(
                      child: GlowText(
                        _xOrOList[index],
                        style:GoogleFonts.openSans(fontSize:70.0,
                          fontWeight:FontWeight.normal,color: _xOrOList[index] == 'x' ? Colors.pinkAccent : Colors.lightBlueAccent,),
                      ),
                    ),
                  ),
                );
              }else if(index==8){
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(

                    decoration:
                    BoxDecoration(border: Border.all(color: Colors.black),

                    ),
                    child: Center(
                      child: GlowText(
                        _xOrOList[index],
                        style:GoogleFonts.openSans(fontSize:70.0,
                          fontWeight:FontWeight.normal,color: _xOrOList[index] == 'x' ? Colors.pinkAccent : Colors.lightBlueAccent,),
                      ),
                    ),
                  ),
                );
              }
              return null;

            }),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (_turnOfO && _xOrOList[index] == '') {
        _xOrOList[index] = 'o';
        _filledBoxes += 1;
      } else if (!_turnOfO && _xOrOList[index] == '') {
        _xOrOList[index] = 'x';
        _filledBoxes += 1;
      }

      _turnOfO = !_turnOfO;
      _checkTheWinner();
    });
  }

  void _checkTheWinner() {
    // check first row
    if (_xOrOList[0] == _xOrOList[1] &&
        _xOrOList[0] == _xOrOList[2] &&
        _xOrOList[0] != '') {
      _showAlertDialog('Winner', _xOrOList[0]);
      return;
    }

    // check second row
    if (_xOrOList[3] == _xOrOList[4] &&
        _xOrOList[3] == _xOrOList[5] &&
        _xOrOList[3] != '') {
      _showAlertDialog('Winner', _xOrOList[3]);
      return;
    }

    // check third row
    if (_xOrOList[6] == _xOrOList[7] &&
        _xOrOList[6] == _xOrOList[8] &&
        _xOrOList[6] != '') {
      _showAlertDialog('Winner', _xOrOList[6]);
      return;
    }

    // check first column
    if (_xOrOList[0] == _xOrOList[3] &&
        _xOrOList[0] == _xOrOList[6] &&
        _xOrOList[0] != '') {
      _showAlertDialog('Winner', _xOrOList[0]);
      return;
    }

    // check second column
    if (_xOrOList[1] == _xOrOList[4] &&
        _xOrOList[1] == _xOrOList[7] &&
        _xOrOList[1] != '') {
      _showAlertDialog('Winner', _xOrOList[1]);
      return;
    }

    // check third column
    if (_xOrOList[2] == _xOrOList[5] &&
        _xOrOList[2] == _xOrOList[8] &&
        _xOrOList[2] != '') {
      _showAlertDialog('Winner', _xOrOList[2]);
      return;
    }

    // check diagonal
    if (_xOrOList[0] == _xOrOList[4] &&
        _xOrOList[0] == _xOrOList[8] &&
        _xOrOList[0] != '') {
      _showAlertDialog('Winner', _xOrOList[0]);
      return;
    }

    // check diagonal
    if (_xOrOList[2] == _xOrOList[4] &&
        _xOrOList[2] == _xOrOList[6] &&
        _xOrOList[2] != '') {
      _showAlertDialog('Winner', _xOrOList[2]);
      return;
    }

    if (_filledBoxes == 9) {
      _showAlertDialog('Draw', '');
    }
  }

  void _showAlertDialog(String title, String winner) {
    showAlertDialog(
        context: context,
        title: title,
        content: winner == ''
            ? 'The match ended in a draw'
            : 'The winner is ${winner.toUpperCase()}',
        defaultActionText: 'OK',
        onOkPressed: () {
          _clearBoard();
          Navigator.of(context).pop();
        });

    if (winner == 'o') {
      _scoreO += 1;
    } else if (winner == 'x') {
      _scoreX += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        _xOrOList[i] = '';
      }
    });

    _filledBoxes = 0;
  }
}
