import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatefulWidget {
  PageIndicator({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _PageIndicator createState() => _PageIndicator();
}

class _PageIndicator extends State<PageIndicator> {
  int _selectedIndex = 0;

  ScrollController? _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }


  
  _moveLeft() {
    _controller!.animateTo(_controller!.offset - 192,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }
  _moveRight() {
    _controller!.animateTo(_controller!.offset + 192,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }
  _jumpStart(){
    _controller!.animateTo(_controller!.position.minScrollExtent, curve: Curves.bounceIn, duration: Duration(milliseconds: 250));
  }
 _jumpEnd(){
   _controller!.animateTo(_controller!.position.maxScrollExtent, curve: Curves.bounceIn, duration: Duration(milliseconds: 250));
 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                _jumpStart();
                setState(() {

                  _selectedIndex = _selectedIndex - 1;
                });
              },
              child: Icon(
                Icons.skip_previous,
              ),
            ),
            MaterialButton(
              onPressed: () {
                _moveLeft();
                setState(() {

                  _selectedIndex = _selectedIndex - 1;
                });
              },
              child: Icon(
                Icons.keyboard_arrow_left,
              ),
            ),
            Container(
             // color: Colors.grey,
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ListView.builder(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  itemExtent: 192,
                  itemCount: 192,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                      width: 60,
                        child: ListTile(
                          title: Text('$index',
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                          selected: index == _selectedIndex,



                          onTap: (){
                            setState(() {
                              _selectedIndex = index;
                              print(_selectedIndex);
                            });
                          },
                        ),
                      ),
                    );
                  }),
            ),
            MaterialButton(
              onPressed: () {
                _moveRight();
                setState(() {
                  _selectedIndex = _selectedIndex + 1;
                  print(_selectedIndex);
                });
              },
              child: Icon(
                Icons.keyboard_arrow_right,
              ),
            ),
            MaterialButton(
              onPressed: () {
                //_moveRight();
                _jumpEnd();
                setState(() {
                  _selectedIndex = _selectedIndex + 1;
                  print(_selectedIndex);
                });
              },
              child: Icon(
                Icons.skip_next,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// child: Row(
// children: [
// ListView.builder(
// scrollDirection: Axis.horizontal,
// itemCount: 192,
// itemBuilder: (context, index){
// return ListTile(
// title: Text('$index'),
// contentPadding: EdgeInsets.all(0),
// hoverColor: Colors.transparent,
//

// selected: index == _selectedIndex,
//
// onTap: (){
// setState(() {
// _selectedIndex = index;
// });
// },
//
// );
// }
// ),
// ],
// ),
// return ListTile(
// title: Container(
// width: 100,
// height: 200,
// child: Text('$index'),
// ),
// hoverColor: Colors.transparent,
//
//
// selected: index == _selectedIndex,
//
// onTap: (){
// setState(() {
// _selectedIndex = index;
// });
// },
//
// );
