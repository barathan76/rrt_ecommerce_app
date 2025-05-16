class Rating {
  final double rate;
  final double count;
  Rating({required this.rate, required this.count});
  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      rate: double.parse(map['rate'].toString()),
      count: double.parse(map['count'].toString()),
    );
  }
  @override
  String toString() {
    return '{rate : $rate, count : $count}';
  }
}
