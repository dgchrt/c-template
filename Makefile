CC = gcc
CFLAGS = -Wall -Wextra -O2 -std=c11
SRC_DIR = src
BUILD_DIR = build
DIST_DIR = dist

SRCS = $(wildcard $(SRC_DIR)/*.c)
HDRS = $(wildcard $(SRC_DIR)/*.h)
OBJS = $(SRCS:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)
PROJECT_NAME = $(notdir $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))
TARGET = $(DIST_DIR)/$(PROJECT_NAME)

.PHONY: all clean format lint run

all: $(TARGET)

$(TARGET): $(OBJS) | $(DIST_DIR)
	$(CC) $(CFLAGS) $^ -o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c $(HDRS) | $(BUILD_DIR)
	$(CC) $(CFLAGS) -I$(SRC_DIR) -c $< -o $@

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(DIST_DIR):
	mkdir -p $(DIST_DIR)

clean:
	rm -rf $(BUILD_DIR) $(DIST_DIR)

format:
	clang-format -i $(SRCS) $(HDRS)

lint:
	cppcheck --enable=all --suppress=missingIncludeSystem $(SRCS) $(HDRS)

run: $(TARGET)
	./$(TARGET)
