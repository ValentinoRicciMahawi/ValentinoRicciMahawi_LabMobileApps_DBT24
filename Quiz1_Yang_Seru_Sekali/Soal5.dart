import 'dart:io';

void main() {
  Ujian ujian = Ujian();

  for (int i = 0; i < 3; i++) {
    stdout.write("Input nama mahasiswa: ");
    String nama = stdin.readLineSync()!;

    stdout.write("Input nilai $nama: ");
    int nilai = int.parse(stdin.readLineSync()!);

    ujian.tambahNilai(nilai);
  }

  print("Rata-rata nilai : ${ujian.hitungRataRata()}");
}

class Ujian {
  List<int> nilaiList = [];

  void tambahNilai(int nilai) {
    nilaiList.add(nilai);
  }

  double hitungRataRata() {
    int total = 0;

    for (var n in nilaiList) {
      total += n;
    }

    return total / nilaiList.length;
  }
}
