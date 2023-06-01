abstract class CalcEvents {}

class AddEvent extends CalcEvents {
  final int a;
  final int b;
  AddEvent(this.a, this.b);
}

class SubEvent extends CalcEvents {
  final int a;
  final int b;
  SubEvent(this.a, this.b);
}

class divEvent extends CalcEvents {
  final int a;
  final int b;
  divEvent(this.a, this.b);
}

class mulEvent extends CalcEvents {
  final int a;
  final int b;
  mulEvent(this.a, this.b);
}
