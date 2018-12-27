import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_demo/mvp/presenter/fl_presenter_impl.dart';
import 'package:flutter_demo/mvp/presenter/fl_presenter.dart';
import 'package:flutter_demo/model/fl_model.dart';

class TabGirlPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new GirlsAppPage(),
    );
  }
}

class GirlsAppPage extends StatefulWidget{

  @override
  State createState() => new _GirlsAppPageState();
}

class _GirlsAppPageState extends State<GirlsAppPage> implements FLView{
  FLPresenter _flPresenter;
  List<FLModel> datas = [];
  bool isSlideUp = false;
  int curPageNum = 1;
  ScrollController _scrollController;

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
        _loadData();
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
    _scrollController = new ScrollController()..addListener(_scrollListener);
    print("girl");
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_scrollListener);
  }

  Future<Null> _refreshData() {
    isSlideUp = false;
    final Completer<Null> completer = new Completer<Null>();
    curPageNum = 1;
    _flPresenter.loadFLData(curPageNum, 10);
    setState(() {});
    completer.complete(null);
    return completer.future;
  }

  Future<Null> _loadData() {
    isSlideUp = true;
    final Completer<Null> completer = new Completer<Null>();
    curPageNum = curPageNum + 1;
    _flPresenter.loadFLData(curPageNum, 10);
    setState(() {});
    completer.complete(null);
    return completer.future;
  }

  @override
  void setPresenter(FLPresenter flPresenter){
    _flPresenter = flPresenter;
  }
  
  @override
  void onloadFLSuccess(List<FLModel> list){
    if (!mounted) return; //异步处理，防止报错
    setState(() {
      if (isSlideUp) {
        datas.addAll(list);
      } else {
        datas = list;
      }
    });
  }

  @override
  void onloadFLFail(){
    // todo
  }
  
  

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      
    );
  }
}