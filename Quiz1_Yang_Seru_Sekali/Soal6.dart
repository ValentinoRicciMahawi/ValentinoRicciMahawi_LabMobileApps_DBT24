void main() {
  Account akun = Account();

  akun.deposit(1500);
  akun.withdraw(300);

  print("Your final balance: ${akun.balance}");
}

class Account {
  int balance = 0;

  void deposit(int amount) {
    balance = balance + amount;
  }

  void withdraw(int amount) {
    if (balance - amount >= 0) {
      balance = balance - amount;
    } else {
      print("Saldo anda tidak cukup");
    }
  }
}