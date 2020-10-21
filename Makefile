OUT = bin

SRC = $(wildcard src/*.c)
OBJ = $(SRC:.c=.o)
EXEC = $(wildcard exec/*.c)
BIN = $(EXEC:exec/%.c=$(OUT)/%)

CFLAGS := -I ./include
LFLAGS :=

.PHONY: all clean

all: $(BIN)

$(OUT)/%: $(OBJ) exec/%.o
	@mkdir -p $(@D)
	$(CC) -o $@ $+

clean:
	rm -rf $(OUT) $(OBJ) $(BIN)
