class Transaction {
  String beneficiary;
  String transDate;
  String brand;
  double amount;

  Transaction({
    required this.beneficiary,
    required this.brand,
    required this.amount,
    required this.transDate,
  });
}

List transactions = <Transaction>[
  Transaction(beneficiary: 'Uber Ride', brand: 'uber.jpg', amount: -25.097, transDate: '09-04-2021'),
  Transaction(beneficiary: 'Nike Outlet', brand: 'nike.png', amount: -105.097, transDate: '25-06-2021'),
  Transaction(beneficiary: 'Payment Received', brand: 'male_avatar', amount: -500.097, transDate: '27-06-2021'),
];
