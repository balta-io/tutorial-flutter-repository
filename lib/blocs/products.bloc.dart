// import 'package:prodcat/models/product.model.dart';
// import 'package:prodcat/repositories/product.repository.dart';
// import 'package:rxdart/rxdart.dart';

// class ProductsBloc {
//   final _repository = ProductRepository();
//   final _productsFetcher = PublishSubject<ProductModel>();

//   Observable<ProductModel> get allMovies => _productsFetcher.stream;

//   getProducts() async {
//     ProductModel itemModel = await _repository.getProducts();
//     _productsFetcher.sink.add(itemModel);
//   }

//   dispose() {
//     _productsFetcher.close();
//   }
// }

// final bloc = ProductsBloc();
