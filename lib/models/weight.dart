import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Weight extends Equatable{
  final int index;
  final String imgPath;


  Weight({required this.index, required this.imgPath});

  @override
  // TODO: implement props
  List<Object?> get props => [index, imgPath];

}