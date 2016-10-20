LDFLAGS=-lcurl -lgcrypt -lmicrohttpd
CFLAGS=-Wall
CC=gcc

SRC=$(wildcard src/*.c)
H=$(wildcard src/*.h)
OBJECTS=$(SRC:.c=.o)

EXECUTABLE=httptest

all: $(EXECUTABLE) 

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $@ $(LDFLAGS)

.PHONY: clean

clean:
	rm -rf src/*.o client

*.o: *.c
	$(CC) $(CFLAGS) -c -o $@ $<

print-%  : ; @echo $* = $($*)
