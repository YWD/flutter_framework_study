/// mixin

void main() {
  C().myPrint();
}

abstract class WildDad {

  WildDad() {
    init();
  }

  init();
}

mixin A on WildDad {

  @override
  init() {
    print('A init');
  }

  void myPrint() {
    print('this is A');
  }
}

mixin D on WildDad, A {

  @override
  init() {
    print('D init');
  }

  void myPrint() {
    print('this is D');
  }

  void myDPrint() {
    print('this is My D');
  }
}

mixin B on D, A {
  void myPrint() {
    super.myDPrint();
    super.myPrint();
    print('this is B');
  }
}

class C extends WildDad with A, D, B {
  // result A,B,C
  // mixin will definitely cover methods, while it can't ensure who it parent is (for this example,
  // D and A are both B's parent, they both have 'myPrint' which confuse B to call 'super.myPrint').
  void myPrint() {
    super.myPrint();
    print('this is C');
  }
}