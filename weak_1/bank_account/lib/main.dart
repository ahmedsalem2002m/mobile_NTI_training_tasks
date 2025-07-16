import 'dart:io';

void main() {
  String name;
  int accountNumber;
  String accountType;
  double initialBalance;
  int choice;

  name = inputName();
  accountNumber = inputAccountNumber();
  accountType = inputAccountType();
  initialBalance = customInputBalance("initial balance \$");

  do {
    choice = showMenu();
    if (choice == 1) {
      initialBalance = deposit(initialBalance);
    } else if (choice == 2) {
      initialBalance = withdraw(initialBalance);
    } else if (choice == 3) {
      calculateProfit(initialBalance);
    } else if (choice == 4) {
      showSummary(name, accountNumber, accountType, initialBalance);
    } else if (choice == 5) {
      print("Thank you for using the banking system. Goodbay!");
    } else {
      print("Invalid choice");
    }
  } while (choice != 5);
}

String inputName() {
  String? name;
  bool done = true;
  print("Enter your name:");
  name = stdin.readLineSync();
  do {
    if (name == null || name == " ") {
      print("Invalid input; Enter your name:");
      name = stdin.readLineSync();
    } else {
      done = false;
    }
  } while (done);
  return name!;
}

int inputAccountNumber() {
  String? inputAccountNumber;
  bool done = true;
  print("Enter account number:");
  inputAccountNumber = stdin.readLineSync();
  do {
    if (inputAccountNumber == null || inputAccountNumber == " ") {
      print("Invalid input; Enter account number:");
      inputAccountNumber = stdin.readLineSync();
    } else {
      done = false;
    }
  } while (done);

  return int.parse(inputAccountNumber!);
}

String inputAccountType() {
  String? accountType;
  bool done = true;
  print("Enter account type (saving/checking):");
  accountType = stdin.readLineSync();
  do {
    if (accountType == null || accountType == " ") {
      print("Invalid input; Enter account type (saving/checking):");
      accountType = stdin.readLineSync();
    } else {
      done = false;
    }
  } while (done);
  return accountType!;
}

double customInputBalance(String showText) {
  String? input;
  bool done = true;
  print("Enter $showText:");
  input = stdin.readLineSync();
  do {
    if (input == null || input == " " || (double.parse(input) < 0)) {
      print("Invalid input; Enter $showText:");
      input = stdin.readLineSync();
    } else {
      done = false;
    }
  } while (done);

  return double.parse(input!);
}

void showSummary(
  String name,
  int accountNumber,
  String accountType,
  double initialBalance,
) {
  print("----------------Account Summary----------------");
  print("Name: $name");
  print("Account Number: $accountNumber");
  print("Account Type: $accountType");
  print("Current Balance: \$$initialBalance");
  print("Rounded Balance: \$${initialBalance.floor()}");
}

void calculateProfit(double currentBalance) {
  double futureBalance;
  int inputNumberOfYears = customInputBalance("number of years").toInt();
  double inputProfitRate = customInputBalance("annual profit rate %");
  futureBalance = currentBalance * (1 + inputProfitRate * inputNumberOfYears);
  print(
    "Predict future balance after $inputNumberOfYears years: $futureBalance",
  );
  print("Rounded balance: ${futureBalance.floor()}");
}

double withdraw(double currentBalance) {
  double inputWithdraw = customInputBalance("amount to withdraw \$");
  if ((currentBalance - inputWithdraw) >= 0) {
    currentBalance = currentBalance - inputWithdraw;
    print("Withdraw successful. New balance \$$currentBalance");
  } else {
    print("Insufficient balance. current balance \$$currentBalance");
  }
  return currentBalance;
}

double deposit(double initialBalance) {
  double inputDeposit = customInputBalance("amount to deposit \$");
  initialBalance = initialBalance + inputDeposit;
  print("Deposit successful. New balance \$$initialBalance");
  return initialBalance;
}

int showMenu() {
  String? inputChoice;

  print("----------------MENU----------------");
  print("1. Deposit");
  print("2. Withdraw");
  print("3. Predict Future Balance (Profit Model)");
  print("4. View Account Summary");
  print("5. Exit");

  inputChoice = stdin.readLineSync();
  return int.parse(inputChoice!);
}
