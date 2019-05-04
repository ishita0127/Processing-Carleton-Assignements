int [] arrayOfNumbers=new int [] {
  4, 7, 3, 8, 6, 5, 4, 10, 9, 13, 12
};
int leftIndex;
int rightIndex;

int pivotIndex= (int)random(leftIndex, rightIndex);
int pivotValue= pivotIndex;

int partitionIndex;
int temp;
int partitionSort(int arrayOfNumbers[], int rightIndex, int leftIndex)
{
  temp=arrayOfNumbers[pivotIndex];
  arrayOfNumbers[pivotIndex]=arrayOfNumbers[rightIndex];
  arrayOfNumbers[rightIndex]=temp;
  int partitonIndex=leftIndex;

  for (int i=leftIndex; i<rightIndex-1; i++)
  {
    if (arrayOfNumbers[i] < pivotValue)
    {
      temp=arrayOfNumbers[partitionIndex];
      arrayOfNumbers[partitionIndex]=arrayOfNumbers[partitionIndex];
      arrayOfNumbers[partitionIndex]=temp;
      partitionIndex=partitionIndex+1;
    }

    temp=arrayOfNumbers[rightIndex];
    arrayOfNumbers[rightIndex]=arrayOfNumbers[partitionIndex];
    arrayOfNumbers[partitionIndex]=temp;
  }
  return partitionIndex;
}

void setup()
{
  quickSort(arrayOfNumbers, 0, arrayOfNumbers.length-1);
  println(arrayOfNumbers);
}

void quickSort(int arrayOfNumbers[], int leftIndex, int rightIndex)
{
  int pivotIndex;
  if (leftIndex<rightIndex)
  {
    pivotIndex=partitionSort(arrayOfNumbers, leftIndex, rightIndex);
//    quickSort(arrayOfNumbers, leftIndex, pivotIndex-1);
//    quickSort(arrayOfNumbers, pivotIndex, rightIndex);
  }
}

