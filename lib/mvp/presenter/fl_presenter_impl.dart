import 'package:flutter_demo/mvp/presenter/fl_presenter.dart';
import 'package:flutter_demo/mvp/repository/fl_repository_impl.dart';
import 'package:flutter_demo/mvp/repository/fl_repository.dart';

class FLPresenterImpl implements FLPresenter {
  FLView _view;

  FLRepository _repository;

  FLPresenterImpl(this._view) {
    _view.setPresenter(this);
  }

  @override
  void loadFLData(int pageNum, int pageSize) {
    assert(_view != null);

    _repository.fetch(pageNum,pageSize).then((data) {
      _view.onloadFLSuccess(data);
    }).catchError((error) {
      print(error);
      _view.onloadFLFail();
    });
  }

  @override
  init() {
    _repository = new FLRepositoryImpl();
  }
}
