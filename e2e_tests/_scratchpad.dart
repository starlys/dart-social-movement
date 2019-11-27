import 'dart:io';

class Color {
  int _r;
  Color.plain() {}
  Color.fromRGB(int r, int g, int b) :
    _r = r { //this assignment runs first
    //body //this body runs third
    print('3');
  }
}
class AlphaColor extends Color {
  int _a;
  AlphaColor.fromRGBA(int r, int g, int b, int a) : 
    _a = a,
    super.fromRGB(r,g,b) { //this assignment runs second
    //body //this body runs fourth
    print('4');
  }

  AlphaColor.plain() : super.plain();

}
///scratchpad/tests
main() async {
  var c2 = AlphaColor.fromRGBA(1, 2, 3, 4);
  //stdin.readLineSync();
}




