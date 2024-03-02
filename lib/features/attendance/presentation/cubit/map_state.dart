abstract class MapState{}

class MapInitialState extends MapState{}
class GetMyCurrentLocationState extends MapState{}

class GetMyCurrentLocationLoadingState extends MapState{}
class GetMyCurrentLocationSuccessState extends MapState{}
class GetMyCurrentLocationErrorState extends MapState{}

class ChangeCheckInOutStatusState extends MapState{}