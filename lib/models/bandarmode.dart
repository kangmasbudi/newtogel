class Listbandar {
  final int id;
  final String judul;
  final String deskripsi;
  final String gambar;
  final String link;

  Listbandar({this.id, this.judul, this.deskripsi, this.gambar, this.link});


  factory Listbandar.fromJson(Map<String, dynamic> json) {
    return new Listbandar(
      id: json['id'],
      judul: json['judul'],
      deskripsi: json['deskripsi'],
      gambar: json['gambar'],
      link: json['link'],
    );
  }

}
