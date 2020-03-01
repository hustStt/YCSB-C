

#LEVELDB_INCLUDE=/home/lzw/nvm_rocksdb/test_rocksdb/include              #Rocksdb的头文件
#LEVELDB_LIBRARY=/home/lzw/nvm_rocksdb/test_rocksdb/librocksdb.a   #Rocksdb的静态链接库

CC=g++
CFLAGS=-std=c++11 -g -Wall -Wno-format -pthread -I./ 
LDFLAGS= -lpthread -lleveldb -lz# -lpmem -lnuma #lsnappy
SUBDIRS= core db 
SUBSRCS=$(wildcard core/*.cc) $(wildcard db/leveldb_db.cc db/db_factory.cc)
OBJECTS=$(SUBSRCS:.cc=.o)
EXEC=ycsbc

all: $(SUBDIRS) $(EXEC)

$(SUBDIRS):
	$(MAKE) -C $@
	#$(MAKE) -C $@ ROCKSDB_INCLUDE=${ROCKSDB_INCLUDE}

$(EXEC): $(wildcard *.cc) $(OBJECTS)
	$(CC) $(CFLAGS) $^ $(LDFLAGS) -o $@

clean:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir $@; \
	done
	$(RM) $(EXEC)

.PHONY: $(SUBDIRS) $(EXEC)

