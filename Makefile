CC=g++
CFLAGS=-c -Wall -g -fpic -std=c++1y -Werror
LDFLAGS=-shared
SRCS=Insert.cpp Select.cpp Merge.cpp Heap.cpp Quick.cpp Bubble.cpp Shell.cpp \
Comb.cpp Counting.cpp Bucket.cpp Radix.cpp STL.cpp
OBJS=$(SRCS:.cpp=.o)


all: libsort.so test

libsort.so: $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o $@

%.o: %.cpp
	$(CC) $(CFLAGS) $< -o $@

depend: .depend

.depend: $(SRCS)
	rm -f ./.depend
	$(CC) $(CFLAGS) -MM $^ > ./.depend
	
include .depend

clean:
	rm -f $(LIB) $(OBJS)
	$(MAKE) -C test clean
	
test:
	$(MAKE) -C test run
	
.PHONY: clean test
