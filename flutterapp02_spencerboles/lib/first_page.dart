import 'package:flutter/material.dart';

class MyFirstPage extends StatefulWidget {
  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  bool _enabled = false;
  String _msg1 = ''; 
  //local variables  
  String _resetMsg = '';
  int _count = 0; 

  @override
  Widget build(BuildContext context) {
    Object onPressed1() {
      if (_enabled) {
        print('onPressed1 returning address of anon func but NOT running it'); 
        
        return () { 
          //needed to manage state of statefull widget --> allows click me button to update on click
          setState(() {
           //increments count when button pressed 
          _count++;
          print('Button Pressed as anon func now running');  
          //update button message
          _msg1 = 'Clicked $_count';
          });
        };
      } else {
        print('onPressed1 returning NULL');
        return null;
      }
    } 

    //runs when reset button is pressed
    Object onPressedReset()
    {
       if(_enabled)
      {
        return () { 
          setState(() { 
            //reset press count to 0
            _count = 0;  
            //display zero count message
            _msg1 = 'Click Me';
            }
          );
        };
      } 
      else 
      {
        return null;
      } 
     
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Button Functionality Demo'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('enable functionality'),
                Switch(
                    value: _enabled,
                    onChanged: (bool onChangedValue) {
                      print('onChangedValue is $onChangedValue');
                      setState(() {
                        _enabled = onChangedValue;
                        if (_enabled) { 
                          //check if button count message is zero
                          _count == 0?_msg1 = 'Click Me':_msg1 = 'Clicked $_count';  
                          //initalize reset button message
                          _resetMsg = 'Reset';
                          print('_enabled is true');
                        } else { 
                          //set messages to '' so text cannot be seen
                          _msg1 = ''; 
                          _resetMsg = '';
                          print('_enabled is false');
                        }
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 8,
                    textColor: Colors.red.shade100,
                    color: Colors.redAccent,
                    highlightColor: Colors.blue,
                    splashColor: Colors.green.shade300,
                    padding: EdgeInsets.all(20.0),
                    onPressed: onPressed1(),
                    child: Text(_msg1),
                  ),
                ),
                 Container(
                  margin: EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 8,
                    textColor: Colors.red.shade100,
                    color: Colors.lightBlue,
                    highlightColor: Colors.blue,
                    splashColor: Colors.lightBlue,
                    padding: EdgeInsets.all(20.0),
                    onPressed: onPressedReset(),
                    child: Text(_resetMsg),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
