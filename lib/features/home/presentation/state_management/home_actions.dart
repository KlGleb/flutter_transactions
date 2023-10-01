sealed class HomeAction {}

class SubscribeToTransactions extends HomeAction {}

class UnsubscribeFromTransactions extends HomeAction {}

class SubscribeToCount extends HomeAction {}

class UnsubscribeFromCount extends HomeAction {}

class Logout extends HomeAction {}

class SyncTransactions extends HomeAction {}

class SyncCompleted extends HomeAction {}
