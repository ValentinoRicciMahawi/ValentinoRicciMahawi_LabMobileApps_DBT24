import 'dart:io';
import 'dart:math';

void main() {
  List<String> pilihan = ['gunting', 'batu', 'kertas'];
  Random random = Random();

  String komputer = pilihan[random.nextInt(3)];

  stdout.write('Pilih (gunting/batu/kertas): ');
  String? user = stdin.readLineSync();

  if (user == null || !pilihan.contains(user)) {
    print('Gak valid');
    return;
  }

  print('Komputer memilih: $komputer');

  if (user == komputer) {
    print('Hasil: Seri');
  } else if (
      (user == 'gunting' && komputer == 'kertas') ||
      (user == 'batu' && komputer == 'gunting') ||
      (user == 'kertas' && komputer == 'batu')) {
    print('Hasil: jago bangettt');
  } else {
    print('Hasil: Cupu');
  }
}