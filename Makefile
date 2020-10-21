SRC = $(wildcard src/*.c)
EXEC = $(wildcard exec/*.c)

SRC_O = $(SRC:.c=.o)
EXEC_O = $(EXEC:.c=.o)

BIN = bin

BIN_O = $(EXEC_O:exec/%.o=bin/%)

CFLAGS := -I ./include
LFLAGS :=

.PHONY: all clean

all: $(BIN_O)

$(BIN)/%: $(SRC_O) exec/%.o
	@mkdir -p $(@D)
	$(CC) -o $@ $+

clean:
	rm -rf $(BIN) $(SRC_O) $(EXEC_O)
