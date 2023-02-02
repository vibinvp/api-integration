// import 'package:api_integration/models/models.dart';
// import 'package:api_integration/repo/repo.dart';

// import 'package:get/get.dart';

// class DataController extends GetxController {
//   var productModel = ProductModel().obs;
//   getData()async{
//     try {
//       var data = DataService().getService();
//       print(data);
//        print('data');
//        productModel.value =data;
      
//       if(data!=null){
//         productModel.value =data as ProductModel;
       
//       }
      
//     } catch (e) {
//       GetSnackBar(
//         title: '$e',
//       );
      
//     }
//   }

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     getData();
//     super.onInit();
//   }
// }
