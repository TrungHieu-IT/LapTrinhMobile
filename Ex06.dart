//import thu vien
import 'dart:io';

void main() {
  int a = 0;
  //Bai 6
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

  String binary = '';
  int temp = a;
  while (temp > 0) {
    int remainder = temp % 2; // Lấy phần dư khi chia cho 2
    binary = remainder.toString() + binary; // Ghép phần dư vào chuỗi kết quả
    temp ~/= 2; // Lấy phần nguyên khi chia cho 2
  }

  print("Số nhị phân của $a là: $binary");

  //Bai 7
  int sum = 0;
  for (int i = 0; i <= a / 2; i++) {
    if (a % i == 0) {
      sum += i;
    }
  }
  print("Tong uoc cua $a = $sum");
}
