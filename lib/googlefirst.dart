import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:file_share/MyHomePage.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class firstpage extends StatefulWidget {
  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  GoogleSignInAccount? _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  String url = "";
  String name = "";
  String email = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'File Share',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Opacity(opacity: 0.5,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: Colors.blueAccent,
                height: 250,
              ),
            ),
          ),
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              color: Colors.blue,
              alignment: Alignment.center,
              height: 230,
              child: Text(
                "Student Teacher document sharing app", style: TextStyle(
                fontSize: 20, color: Colors.white
              ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Container(
                height: 40,
                width: 200,
                child: ElevatedButton(
                  child: Text(" Google Sign in "),
                  onPressed: () {
                    _googleSignIn.signIn().then((userData) {
                      _navigateToNextScreen(context);
                      setState(() {
                      });
                    }).catchError((e) {
                      print(e);
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
   }


class WaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
      debugPrint (size . width . toString());
      var path = new Path ();
      path.lineTo (0, size. height) ;
      var firstStart  = Offset (size. width/ 5, size.height) ;

      var firstEnd = Offset (size . width / 2.25, size.height - 59.0);

      path.quadraticBezierTo (firstStart.dx, firstStart . dy,
          firstEnd . dx, firstEnd . dy);
      var secondStart = Offset (size.width - (size.width / 3.24),
          size.height- 105);
      var secondEnd = Offset (size. width, size . height - 10);
      path.quadraticBezierTo (secondStart.dx, secondStart.dy,
          secondEnd.dx, secondEnd. dy) ;
      path.lineTo (size . width, 0);
      path.close ();
      return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }

}

