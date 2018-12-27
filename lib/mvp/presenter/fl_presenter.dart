
import 'package:flutter_demo/model/fl_model.dart';
import 'package:flutter_demo/mvp/mvp.dart';

abstract class FLPresenter implements IPresenter{
  void loadFLData(int pageNum, int pageSize);
}

abstract class FLView implements IView<FLPresenter>{
  void onloadFLSuccess(List<FLModel> list);
  void onloadFLFail();
}