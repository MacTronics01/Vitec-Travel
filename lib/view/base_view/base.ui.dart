import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';
import '../../view_models/base_view_model/base.vm.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child)? builder;
  final Function(T)? onModelReady;
  final Color color;
  const BaseView({Key? key, this.builder, this.onModelReady, this.color = Colors.white}) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = getIt<T>();

  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (_) => model,
        child: Consumer<T>(
          builder: (_, model, __) => Stack(
            children: [
              widget.builder!.call(_, model, __),
              if (model.isLoading)
                Stack(children: [
                  ModalBarrier(color: widget.color),
                  const Center(
                      child: SpinKitFadingCube(
                        color: Colors.blue,
                        size: 60,
                      ))
                ])
              else
                const SizedBox(),
            ],
            //widget.builder!,
          ),
        ));
  }
}
