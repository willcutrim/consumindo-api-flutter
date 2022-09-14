class Produtos {
  int? id;
  String? nome;
  String? descricao;
  String? preco;

  Produtos({this.id, this.nome, this.descricao, this.preco});

  Produtos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
    preco = json['preco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['preco'] = this.preco;
    return data;
  }
}
