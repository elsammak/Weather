# Weather
Weather is a weather application which retreive weather information from worldweatheronline service.

The structure of this project is MVVM:-
![Alt text](https://github.com/elsammak/Weather/blob/master/Weather/Walking_skeleton.png "Walking Skeleton").

For case of any other UIViewController needed:-

1. Subclass `AbstractViewController`.
2. Create a new viewModel class which inherits from `AbstractViewModel`.
3. This viewModel class should have a protocol which inhertis from `AbstractDataDelegate`, this protocol is used as a connection between ViewModel layer and View layer.
4. Add a new DatamMnager class with a singlton design pattern. This class will be responsible for connecting to APIClient and parsing returning JSON objects.
5. Add required Entity classes.
