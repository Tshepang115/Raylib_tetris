# 1. Compiler and Flags
CXX = g++
CXXFLAGS = -std=c++20 -Wall -Iinclude

# Linux linker flags required for Raylib
LDFLAGS = -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

# 2. Files and Output
SRC = $(wildcard src/*.cpp)
OBJ = $(SRC:.cpp=.o)
EXEC = Tetris

# 3. Targets
all: $(EXEC)

# Link object files into the final executable
$(EXEC): $(OBJ)
	$(CXX) $(OBJ) -o $@ $(LDFLAGS)

# Compile each .cpp file into a .o file
src/%.o: src/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up compiled files
clean:
	rm -f src/*.o $(EXEC)

# Compile (if needed) and run the game
run: all
	./$(EXEC)

.PHONY: all clean run
