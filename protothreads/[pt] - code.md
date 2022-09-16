## [protothread] -


```c
#ifndef PC_H

#define PC_H

typedef unsigned int INT16U;

struct pt
{
  INT16U lc;
};

#define PT_THREAD_WAITING   0
#define PT_THREAD_EXITED    1

//初始化任务变量，只在初始化函数中执行一次就行
#define PT_INIT(pt)     (pt)->lc = 0

//启动任务处理，放在函数开始处
#define PT_BEGIN(pt)    switch((pt)->lc) { case 0:

// 等待某个条件成立，若条件不成立则直接退出本函数，下一次进入本函数就直接跳到这个地方判断
// __LINE__ 编译器内置宏，代表当前行号,比如:若当前行号为8,则 s = __LINE__; case __LINE__: 展开为 s = 8; case 8:
#define PT_WAIT_UNTIL(pt,condition)   (pt)->lc = __LINE__;   case __LINE__: /
                                      if(!(condition))  return

// 结束任务,放在函数的最后
#define PT_END(pt)      }

// 等待某个条件不成立
#define PT_WAIT_WHILE(pt,cond)    PT_WAIT_UNTIL((pt),!(cond))

// 等待某个子任务执行完成
#define PT_WAIT_THREAD(pt,thread)   PT_WAIT_UNTIL((pt),(thread))

// 新建一个子任务,并等待其执行完退出
#define PT_SPAWN(pt,thread) /
  PT_INIT((pt));            /
  PT_WAIT_THREAD((pt),(thread))

// 重新启动某任务执行
#define PT_RESTART(pt)  PT_INIT(pt); return

// 任务后面的部分不执行,直接退出
#define PT_EXIT(pt)     (pt)->lc = PT_THREAD_EXITED;return

#endif


```