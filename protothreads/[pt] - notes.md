## [protothreads] - notes

* single stack shared by all threads
* Protothreads are similar to asymmetric co-routines
* all protothreads run on the same stack and context switching is done by stack rewinding
* requires only two bytes of memory per protothreads.
* non-blocking in nature
* spawning a separate protothreads for each potentially blocking function

### protothreads data structure

#### pt


#### pt_sem



### protothreads library

#### lc-addrlabels.h
> Implementation of local continuations based on the "Labels as values" feature of gcc


#### lc-switch.h
> (Implementation of local continuations based on switch() statement



#### lc.h
> Local continuations


#### pt-sem.h
> Counting semaphores implemented on protothreads


#### pt.h
> Protothreads implementation


