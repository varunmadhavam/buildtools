OUTPUT  = $(shell basename "`pwd`")
CC      = gcc
CFLAGS  = -g -Os -I./src 
DFLAGS  = -MM
LFLAGS  = -g 
DLINKS  = -lpthread
DEPS    = 
TMP     = tmp
SRC     = src
BIN     = bin
SRCS    = $(wildcard $(SRC)/*.c)
HEADERS = $(wildcard $(SRC)/*.h)
OBJS    = $(patsubst $(SRC)/%.c,$(TMP)/%.o,$(SRCS))

all: $(BIN)/$(OUTPUT)


$(TMP)/%.o: $(SRC)/%.c
	$(CC) $(CFLAGS) -o $@ -c $<
	@$(CC) $(DFLAGS) $<  | sed -e 's/\\//' | tr -d '\n' | sed -e 's/^/tmp\//'  > $(TMP)/$*.d

bin/$(OUTPUT): $(OBJS)
	$(CC) $(LFLAGS) -o $(BIN)/$(OUTPUT) $^ $(DLINKS)

clean:
	rm -f bin/* tmp/*

run:
	@$(BIN)/$(OUTPUT)

-include $(OBJS:.o=.d)
