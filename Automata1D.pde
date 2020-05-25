//int ruleSet[] = {0, 0, 0, 0, 0, 0, 0, 1}; // 1
//int ruleSet[] = {0, 0, 0, 1, 1, 1, 1, 0}; // 30
//int ruleSet[] = {0, 1, 1, 1, 1, 1, 1, 0}; // 126
//int ruleSet[] = {1, 0, 0, 1, 0, 1, 1, 0}; // 150
//int ruleSet[] = {0, 0, 1, 1, 1, 0, 0, 1}; // 150
//int ruleSet[] = {0, 0, 1, 1, 1, 0, 0, 1}; // 57n
//int ruleSet[] = {1, 0, 0, 1, 1, 1, 0, 0}; // 57i
//int ruleSet[] = {0, 0, 1, 1, 1, 0, 0, 0}; // 56
int ruleSet[] = {1, 0, 0, 1, 1, 1, 1, 0}; // 158
//int ruleSet[] = {1, 1, 0, 1, 1, 1, 1, 0}; // 222
//int ruleSet[] = {0, 1, 1, 0, 0, 0, 1, 1}; // 99
//int ruleSet[] = {0, 1, 1, 0, 0, 1, 0, 1}; // 101
//int ruleSet[] = {0, 1, 0, 0, 1, 0, 1, 1}; // 75
//int ruleSet[] = {0, 1, 0, 0, 0, 1, 0, 1}; // 69
//int ruleSet[] = {0, 1, 0, 0, 1, 1, 1, 1}; // 79
//int ruleSet[] = {1, 1, 1, 1, 0, 0, 1, 0}; // 242
//int ruleSet[] = {0, 1, 0, 0, 1, 1, 0, 1}; // 77
//int ruleSet[] = {0, 0, 1, 0, 1, 1, 0, 0}; // 44
//int ruleSet[] = {0, 0, 1, 1, 0, 1, 0, 0}; // 52
//int ruleSet[] = {1, 0, 0, 1, 0, 1, 1, 0}; // 150
//int ruleSet[] = {1, 0, 0, 1, 1, 1, 1, 1}; // 159
//int ruleSet[] = {1, 0, 0, 1, 1, 1, 0, 1}; // 157

int actualGen[];
int nextGen[];
int currentGeneration = 0;
int sizeSquare = 5;

void setup(){
  size(1001, 1000);
  actualGen = new int[width/sizeSquare];
  java.util.Arrays.fill(actualGen, 0);
  actualGen[(int)((actualGen.length/2)+1)] = 1;
  nextGen = new int[actualGen.length];
  background(255, 255, 255);
  frameRate(24);
}

void draw(){
  if(currentGeneration < 200){
    genPainter(actualGen);
    actualGen = evolve();
    currentGeneration++;
  }
}

void genPainter(int gen[]){
  for(int i = 0; i < width/sizeSquare; i++){
    if(gen[i] == 0){
      stroke(0, 0, 0);
      fill(0, 0, 0);
    }
    else{
      stroke(255, 255, 255);
      fill(255, 255, 255);
    }
    rect(i*sizeSquare, (currentGeneration*sizeSquare), sizeSquare, sizeSquare);
  }
}

int[] evolve(){
  int[] evolved = new int[actualGen.length];  
  for(int i = 1; i < actualGen.length-1; i++){
    int[] nums = {actualGen[i+1], actualGen[i], actualGen[i-1]};
    int finalNum = 0;
    for(int num : nums){
      finalNum = (finalNum << 1) | num;
    }
    evolved[i] = ruleSet[7-finalNum];
  }
  return evolved;
}
