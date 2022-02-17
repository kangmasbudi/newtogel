class Listdataharian {
  final int id;
  final String hari;
  final String tanggal;
  final String result;

  Listdataharian({this.id, this.hari, this.result, this.tanggal});

  factory Listdataharian.fromJson(Map<String, dynamic> json) {
    return new Listdataharian(
      id: json['id'],
      hari: json['hari'],
      tanggal: json['tanggal'],
      result: json['result'],
    );
  }
}
