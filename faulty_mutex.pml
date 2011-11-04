bool turn, flag[2];

init
{
  if
  ::turn = true;
  ::turn = false;
  fi;
  
  flag[0] = 0;
  flag[1] = 0;
  run p0();
  run p1()
}

proctype p0()
{
  Loop:
  flag[0] = 1;
  do
  ::(turn == 1) -> (flag[1] == 0) -> turn = 0
  ::else break
  od;
  assert( turn == 0);
  flag[0] = 0;
  goto Loop
}

proctype p1()
{
  Loop:
  flag[1] = 1;
  do
  ::(turn == 0) -> (flag[0] == 0) -> turn = 1
  ::else break
  od;
  assert( turn == 1);
  flag[1] = 0;
  goto Loop
}
