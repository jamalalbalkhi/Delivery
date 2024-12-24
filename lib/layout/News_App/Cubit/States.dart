abstract class newsStates{}

class newsinitialstate extends newsStates{}

class appchangemoodstate extends newsStates{}


class newsbottomnavstate extends newsStates{}

class newsgetbusinesslodingstate extends newsStates{}

class newsgetbusinessSuccessstate extends newsStates{}

class newsgetbusinessErrorstate extends newsStates
{
   late final String error;
   newsgetbusinessErrorstate (this.error);
}
class newsgetsportslodingstate extends newsStates{}

class newsgetsportsSuccessstate extends newsStates{}

class newsgetsportsErrorstate extends newsStates
{
   late final String error;
   newsgetsportsErrorstate (this.error);
}
class newsgetsciencelodingstate extends newsStates{}

class newsgetscienceSuccessstate extends newsStates{}

class newsgetscienceErrorstate extends newsStates
{
   late final String error;
   newsgetscienceErrorstate (this.error);

}