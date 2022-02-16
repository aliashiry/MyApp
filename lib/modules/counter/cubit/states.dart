abstract class CounterStats {}

class CounterInitialState extends CounterStats{}
class CounterPlusState extends CounterStats
{
  final int counter;
  CounterPlusState(this.counter);
}
class CounterMinusState extends CounterStats
{
  final int counter;
  CounterMinusState(this.counter);
}