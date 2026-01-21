import 'dart:io';
import 'dart:math';

void main () {
  int angkaRandom = Random().nextInt(100)+1;
  int tebakan = 0;
  int jumlahTebakan = 0;

  while (tebakan != angkaRandom) {
    stdout.write('Tebak angka antara 1-100: ');
    String? input = stdin.readLineSync();
    if (input == null) {
      print('Input tidak valid!');
      continue;
    }

    tebakan = int.tryParse(input) ?? 0;
    jumlahTebakan++;

    if (tebakan < angkaRandom) {
      print('Terlalu rendah! Coba lagi.');
    } else if (tebakan > angkaRandom) {
      print('Terlalu tinggi! Coba lagi.');
    } else {
      print('Anjay! Kamu menebak dengan benar dalam $jumlahTebakan kali tebakan.');
    }
  }
}