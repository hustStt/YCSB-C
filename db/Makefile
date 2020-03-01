CC=g++
CFLAGS=-std=c++11 -c -g -Wall# -fgnu-tm
INCLUDES=-I../
SOURCES=$(wildcard leveldb_db.cc db_factory.cc)
OBJECTS=$(SOURCES:.cc=.o)

all: $(SOURCES) $(OBJECTS)

.cc.o:
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@

clean:
	$(RM) $(OBJECTS)

