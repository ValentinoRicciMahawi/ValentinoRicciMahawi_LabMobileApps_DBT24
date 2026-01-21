import 'dart:io';

void main() {
  stdout.write("Masukkan angka: ");
  int angka = int.parse(stdin.readLineSync()!);

  bool hasil = cekPerfectNumber(angka);
  print(hasil);
}

bool cekPerfectNumber(int angka) {
  int total = 0;

  for (int i = 1; i < angka; i++) {
    if (angka % i == 0) {
      total = total + i;
    }
  }

  if (total == angka) {
    return true;
  } else {
    return false;
  }
}