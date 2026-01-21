void main() {
  List<int> a = [1, 3, 5, 7];
  List<int> b = [2, 4, 6, 8];

  List<int> gabungan = [...a, ...b];

  int terbesar = gabungan[0];
  int terbesarKedua = gabungan[0];

  for (var angka in gabungan) {
    if (angka > terbesar) {
      terbesarKedua = terbesar;
      terbesar = angka;
    } else if (angka < terbesar && angka > terbesarKedua) {
      terbesarKedua = angka;
    }
  }

  print("Hasil gabungannya adalah $gabungan");
  print("Angka terbesar kedua adalah $terbesarKedua");
}