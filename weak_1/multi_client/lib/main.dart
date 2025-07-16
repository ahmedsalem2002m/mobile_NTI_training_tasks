import 'dart:io';

void main() {
  do{
    String? inputChoice;
  int choice;
  double subTotal = 0;
  String name;
  int phoneNumber = 0 ;
  double taxPersentage = 13;
  double subTax = 0 ;
  double deliveryFee= 0;
  double discount = 0;


  showMenu();
    do {
    print("Enter product number to add to cart (0 to finish):");
    inputChoice = stdin.readLineSync();
    choice = int.parse(inputChoice!);
    if (choice >= 1 && choice <= 5) {
      subTotal += calculateSubTotal(choice);
    } else if (choice != 0) {
      print("Invalid product!");
    }
  } while (choice != 0);

  name = customInputMessage("Please enter your name");
  phoneNumber = customInputNumber("Please enter your phone number").toInt();

  subTax =firstMessage(subTotal, discount, taxPersentage);
  deliveryFee = deliveryMessage();
  finalMessage(subTotal,subTax,discount,deliveryFee,name);
  }while(true);
}

void finalMessage(double subTotal,double subTax,double discount,double deliveryFee,String name) {
  double SubTotalAfterTax = 0;
  double subTotalAfterDiscount = 0;
  SubTotalAfterTax = calculateSubTotalAfterTax(subTax, subTotal);
  subTotalAfterDiscount = calculateDiscount(discount, SubTotalAfterTax);
  print("--------------------");
  print("Total amount to pay: ${total(subTotalAfterDiscount, deliveryFee)}");
  print("Thank you for shopping with us, $name!");
    print("-------------------------------------\n\n\n");

}

double deliveryMessage(){
  double distance=0;
  distance = calculateDeliveryDistance();
  print("Delivery fee:\$${calculateDeliveryFee(distance)}");
  return calculateDeliveryFee(distance);
}

double  firstMessage(double subTotal,double discount,double taxPersentage){
  double subTax;
  print("Subtotal: \$$subTotal");
  subTax = CalculateTax(taxPersentage,subTotal);
  print("Tax (${taxPersentage.toInt()}%): \$$subTax");
  print("Discount: \$$discount");

  return subTax;
}

double total(double subTotalAfterDiscount,double deliveryFee){
  return subTotalAfterDiscount+deliveryFee;
}

double calculateSubTotalAfterTax(double subTax, double subTotal){
  return subTax + subTotal;
}

double calculateDiscount(double discount,double subTotalAfterTax){
  return (1-discount/100)*subTotalAfterTax;

}

double calculateDeliveryFee(double deliveryDistance) {
  return deliveryDistance* 1.8;
}

double calculateDeliveryDistance () {
  bool choice = true;
  String? isDelivery;
  double distance = 0;
  do{
      isDelivery =  customInputMessage("Do you want delivery? (yes/no)");
      if(isDelivery == "yes"){
        distance = customInputNumber("Enter delivery distance in km");
        choice = false;
      }else if(isDelivery =="no"){
        choice = false;
      }else{
        print("Invalid disatnce");
      }

  }while(choice);
  return distance;
}

 double CalculateTax(double taxPersentage, double subTotal) {
  return (taxPersentage/100)*subTotal;
}

String customInputMessage(String message) {
  String? name;
  bool done = true;
  print("$message:");
  name = stdin.readLineSync();
  do {
    if (name == null || name == " ") {
      print("Invalid input; $message:");
      name = stdin.readLineSync();
    } else {
      done = false;
    }
  } while (done);
  return name!;
}

double customInputNumber(String message) {
  String? inputNumber;
  bool done = true;
  print("$message:");
  inputNumber = stdin.readLineSync();
  do {
    if (inputNumber == null || inputNumber == " " || double.parse(inputNumber!)<0) {
      print("Invalid input; $message:");
      inputNumber = stdin.readLineSync();
    } else {
      done = false;
    }
  } while (done);

  return double.parse(inputNumber!);
}

double calculateSubTotal(int? choiceProduct) {
  String? inputChoice;
  int choice;
  double subTotal = 0;
  double headphones = 150;
  double usb = 20;
  double monitor = 300;
  double mouse = 50;
  double keyboard = 100;

  do {
    print("Enter quantity:");
    inputChoice = stdin.readLineSync();
    choice = int.parse(inputChoice!);
    if (choice >= 0) {
      if (choiceProduct == 1) {
        subTotal = choice*keyboard;
      } else if (choiceProduct == 2) {
        subTotal = choice*mouse;
      } else if (choiceProduct == 3) {
        subTotal = choice*monitor;
      } else if (choiceProduct == 4) {
        subTotal = choice*usb;
      } else if (choiceProduct == 5) {
        subTotal = choice*headphones;
      }
    } else {
      print("Invalid quantity!");
    }
  } while (choice < 0);

  return subTotal;
}

void showMenu() {
  print(
    "-------------------------Welcome to the store!-------------------------",
  );
  print("Available products:");
  customShowProduct(1, "Keyboard", 100);
  customShowProduct(2, "Mouse", 50);
  customShowProduct(3, "Monitor", 300);
  customShowProduct(4, "USB Cable", 20);
  customShowProduct(5, "Headphones", 150);
}

void customShowProduct(int number, String nameProduct, double price) {
  print("$number. $nameProduct - \$${price.toInt()}");
}
