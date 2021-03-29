import 'package:flutter/material.dart';
import 'package:project_th/network/api_executer.dart';
import 'package:project_th/route/locator.dart';

abstract class BaseUseCase {
  @protected
  final ApiExecuter apiExecuter = locator<ApiExecuter>();

  void executeAsync(
      {BaseUseCaseParameter? parameter, BaseUseCaseCallback? callback});
}

abstract class BaseUseCaseParameter {}

abstract class BaseUseCaseCallback {}
