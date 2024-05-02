import 'package:e_commerce/features/categores/data/model/product_model/product_model.dart';
import 'package:e_commerce/features/categores/data/repos/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepo) : super(ProductInitial());
  final ProductRepo _productRepo;

  static ProductCubit get(context) => BlocProvider.of(context);

  List<ProductModel> allProductsList = [];
  Future<void> getProducts() async {
    emit(ProductLoading());
    var result = await _productRepo.getProducts();
    result.fold((error) {
      emit(Productfailuer(error.message));
    }, (success) {
      emit(ProductSuccess());
      allProductsList.addAll(success);
    });
  }
}
