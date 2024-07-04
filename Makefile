.POSIX:
.SUFFIXES:
CC := g++
CFLAGS := -Wall -Wextra -g3 -Wno-unused-variable -Wno-unused-function -fsanitize=undefined
LDFLAGS := -fsanitize=undefined
LDLIBS := -lubsan

SRC := ./src
BUILD := ./build

SOURCES = $(wildcard $(SRC)/*.cpp)
OBJECTS = $(patsubst $(SRC)/%.cpp,$(BUILD)/%.o,$(SOURCES))

EXECUTABLES = $(patsubst $(SRC)/%.cpp,$(BUILD)/%,$(SOURCES))

all: dir $(EXECUTABLES)

dir:
	mkdir -p $(BUILD)

$(EXECUTABLES) : $(BUILD)/%: $(BUILD)/%.o
	$(CC) $(LDFLAGS) $^ -o $@ $(LDLIBS)

$(OBJECTS): $(BUILD)/%.o : $(SRC)/%.cpp
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -rf $(EXECUTABLES)
	rm -rf $(BUILD)/*.o

.PHONY: all clean






