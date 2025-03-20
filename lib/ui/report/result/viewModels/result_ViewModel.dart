import 'dart:async';

import 'package:digprev_flutter/data/repositories/responseCardRepository/responseCardRepository.dart';
import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:flutter/cupertino.dart';

class ResultViewModel extends ChangeNotifier {
  ResultViewModel({required ResponseCardRepository repository})
    : _repository = repository {
    _startObserving();
  }

  final ResponseCardRepository _repository;
  List<ResponseCard> _responseCard = <ResponseCard>[];
  bool _isLoading = true;

  List<ResponseCard> get responseCard => _responseCard;

  bool get isLoading => _isLoading;

  bool get hasData => _responseCard.isNotEmpty;

  late final StreamSubscription<List<ResponseCard>> _subscription;

  void _startObserving() {
    _subscription = _repository.observerAllCompleted().listen(
          (List<ResponseCard> onData) {
        _isLoading = false;
        _responseCard = onData;
        notifyListeners();
      },
      onError: (dynamic error) {
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  void refresh() {
    _isLoading = true;
    notifyListeners();
    _subscription.cancel();
    _startObserving(); // Reinicia a escuta
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
