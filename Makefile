BUILD_DIR := build
TARGET := output

CMAKE := cmake

.PHONY: all clean run rebuild

all: $(BUILD_DIR)/$(TARGET)

$(BUILD_DIR)/$(TARGET):
	@mkdir -p $(BUILD_DIR)
	@$(CMAKE) -B $(BUILD_DIR)
	@$(CMAKE) --build $(BUILD_DIR)

clean:
	@rm -rf $(BUILD_DIR)

rebuild: clean all

run: all
	@./$(BUILD_DIR)/$(TARGET)