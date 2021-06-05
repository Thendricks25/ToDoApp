class Counter {
  int num = 0;
  int get increase => num++;
  int get decrease => num--;
}

class Peaches {
  var suzy = "has peaches";
  var fran;
  askForPeach(suzy) {
    if (suzy == "has peaches") {
      fran = "can I have a peach?";
    } else {
      fran = "Go buy some peaches suzy";
    }
  }
}
