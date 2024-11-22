import 'dart:io';

void main() {
  int a = 0;
  //nhap a
  do {
    stdout.write('Nhap a( > or = 1):');
    String? inputA = stdin.readLineSync();
    if (inputA != null) {
      a = int.tryParse(inputA) ?? 0;
    }
    if (a == 0) {
      print('Buon long nhap lai');
    }
  } while (a == 0);

  //Bai 7
  int sum = 0;
  for (int i = 1; i <= a; i++) {
    if (a % i == 0) {
      sum += i;
    }
  }

  print("Tong uoc cua $a = $sum");
}
