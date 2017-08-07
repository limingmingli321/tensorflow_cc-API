EXE = gen
EXE_SRC = main.cc

C_COMPILER = gcc
CC_COMPILER = g++

INCLUDE_PATH = 	-I/home/e0024/workspace/tf_api_r1.2/tensorflow_cc/include

CFLAGS = -g -std=c++11

LD_LIBRARY_PATH = -L/home/e0024/workspace/tf_api_r1.2/tensorflow_cc/lib

LD_FLAGS = -ltensorflow_cc -lcudnn -lglog

OBJ = tf_api.o
OBJS_DIR = ./
OBJS = $(addprefix $(OBJS_DIR), $(OBJ))



all: $(EXE)
	@echo '---------------- DONE FOR ALL ---------------'

$(EXE): $(OBJS)
	$(CC_COMPILER) $(EXE_SRC) -o $(EXE) $(INCLUDE_PATH) $(LD_LIBRARY_PATH) $(CFLAGS) $(LD_FLAGS) $(OBJS)

$(OBJS_DIR)%.o: %.cc
	$(CC_COMPILER) $(INCLUDE_PATH) $(LD_LIBRARY_PATH) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(EXE)
