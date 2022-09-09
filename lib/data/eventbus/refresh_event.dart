enum RefreshType { ADDRESS, EXP, RATE }

class RefreshEvent {
  final RefreshType type;

  RefreshEvent(this.type);
}
