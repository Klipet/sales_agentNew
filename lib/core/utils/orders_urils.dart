import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../data/models_db/model_db_orders/model_document_db.dart';
import '../constans.dart';
import '../styles_text.dart';

Text textStatut(ModelDocumentDb statut){
  if(statut.state == Constant().SABLON){
   return  Text('dialog.status.'.tr(
      namedArgs: {
        'status': 'home.bodySave'.tr()
      }
    ),
    style: textStyleDialogOrderSub.copyWith(
      decoration: TextDecoration.none,
    ),
  );
  }else if(statut.state == Constant().ASTEPTARE){
   return  Text('dialog.status.'.tr(
        namedArgs: {
          'status': 'home.bodyAwait'.tr()
        }
    ),
      style: textStyleDialogOrderSub.copyWith(
        decoration: TextDecoration.none,
      ),
    );
  }else if(statut.state == Constant().INLUCRU){

    return  Text('dialog.status.'.tr(
        namedArgs: {
          'status': 'home.bodyJob'.tr()
        }
    ),
      style: textStyleDialogOrderSub.copyWith(
        decoration: TextDecoration.none,
      ),
    );
  }else{
    return  Text('dialog.status.'.tr(
        namedArgs: {
          'status': 'home.bodyComplete'.tr()
        }
    ),
      style: textStyleDialogOrderSub.copyWith(
        decoration: TextDecoration.none,
      ),
    );
  }
}

Text adressDialog(ModelDocumentDb address){
  if(address.deliveryAddress == null){
  return  Text(
      'dialog.address'.tr(
        namedArgs: {
          'address': '-----',
        },
      ),
      style: textStyleDialogOrderSub.copyWith(
        decoration: TextDecoration.none,
      ),
    );
  }else{
  return  Text(
      'dialog.address'.tr(
        namedArgs: {
          'address': address.deliveryAddress.toString(),
        },
      ),
      style: textStyleDialogOrderSub.copyWith(
        decoration: TextDecoration.none,
      ),
    );
  }

}