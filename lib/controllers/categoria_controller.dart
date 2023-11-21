import 'package:monews_app/models/categoria_model.dart';

List<CategoriaModel> pegarCategorias() {
  List<CategoriaModel> categorias = [];
  CategoriaModel categoria = CategoriaModel();

  categoria.nomeCategoria = 'Business';
  categoria.nomePtbr = 'Negócios';
  categoria.image = 'lib/images/categorias/negocios.jpg';
  categorias.add(categoria);
  categoria = CategoriaModel();

  categoria.nomeCategoria = 'Entertainment';
  categoria.nomePtbr = 'Entreterimento';
  categoria.image = 'lib/images/categorias/entreterimento.jpg';
  categorias.add(categoria);
  categoria = CategoriaModel();

  categoria.nomeCategoria = 'General';
  categoria.nomePtbr = 'Geral';
  categoria.image = 'lib/images/categorias/gerais.jpg';
  categorias.add(categoria);
  categoria = CategoriaModel();

  categoria.nomeCategoria = 'Health';
  categoria.nomePtbr = 'Saúde';
  categoria.image = 'lib/images/categorias/saude.jpg';
  categorias.add(categoria);
  categoria = CategoriaModel();

  categoria.nomeCategoria = 'Science';
  categoria.nomePtbr = 'Ciência';
  categoria.image = 'lib/images/categorias/ciencia.jpg';
  categorias.add(categoria);
  categoria = CategoriaModel();

  categoria.nomeCategoria = 'Sports';
  categoria.nomePtbr = 'Esportes';
  categoria.image = 'lib/images/categorias/esportes.jpg';
  categorias.add(categoria);
  categoria = CategoriaModel();

  categoria.nomeCategoria = 'Technology';
  categoria.nomePtbr = 'Tecnologia';
 categoria.image = 'lib/images/categorias/tecnologia.jpg';
  categorias.add(categoria);
  categoria = CategoriaModel();

  return categorias;
}
