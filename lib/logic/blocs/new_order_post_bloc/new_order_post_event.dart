import 'package:equatable/equatable.dart';
import 'package:sales_agent/data/models_db/model_db_orders/model_document_db.dart';


abstract class NewOrderPostEvent extends Equatable {
  const NewOrderPostEvent();

  @override
  List<Object?> get props => [];
}

class FetchOrderPostData extends NewOrderPostEvent {
  final int idDocument;
 // final ModelDocumentDb modelDb;

  const FetchOrderPostData(//this.modelDb,
   this.idDocument);

  @override
  List<Object?> get props => [idDocument];
}