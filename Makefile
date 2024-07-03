.POSIX:
.SUFFIXES:
CC := gcc
CFLAGS := -Wall -Wextra -g3 -Wno-unused-variable -Wno-unused-function -fsanitize=undefined
LDFLAGS := -fsanitize=undefined
LDLIBS := -lubsan

SRC := ./src
BUILD := ./build

SOURCES = $(wildcard $(SRC)/*.c)
OBJECTS = $(patsubst $(SRC)/%.c,$(BUILD)/%.o,$(SOURCES))
EXECUTABLE = main

all: dir $(BUILD)/$(EXECUTABLE)

dir:
	mkdir -p $(BUILD)

$(BUILD)/$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $^ -o $@ $(LDLIBS)

$(OBJECTS): $(BUILD)/%.o : $(SRC)/%.c
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -rf $(BUILD)/*.o $(BUILD)/$(EXECUTABLE)

.PHONY: all clean

