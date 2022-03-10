void main() {
  print(isPositive(3)); // true
  print(isPositive(-1)); // false
  int? a = null;
  // print(isPositive(null));
  print(isPositive(a));

}


bool isPositive(int? anInteger) {
  return !anInteger.isNegative;
}