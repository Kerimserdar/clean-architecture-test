class Search {
  final String id;
  final String text;
  final String date;

  Search(this.id, this.text, this.date);

  @override
  String toString() => '$id,$text,$date';
}
