import 'dart:io';

void main() {
  stdout.write("Masukkan angka: ");
  String input = stdin.readLineSync()!;

  int? angka = int.tryParse(input);

  if (angka == null) {
    print("Tidak valid");
  } else {
    bool hasil = cekPrima(angka);
    print(hasil);
  }
}

bool cekPrima(int angka) {
  if (angka <= 1) {
    return false;
  }

  int jumlahPembagi = 0;

  for (var i = 1; i <= angka; i++) {
    if (angka % i == 0) {
      jumlahPembagi++;
    }
  }

  if (jumlahPembagi == 2) {
    return true;
  } else {
    return false;
  }
}