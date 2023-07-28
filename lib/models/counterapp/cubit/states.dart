abstract class CounterStates {}

class CounterInitialState extends CounterStates{}

class CounterPlusState extends CounterStates{
  CounterPlusState(int counter);
}
class CounterMinusState extends CounterStates{
  CounterMinusState(int counter);
}