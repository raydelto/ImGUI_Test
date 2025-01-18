CXX = g++

LIBS = -L. \
	   -L./lib \
      -lglew32\
	  -lglfw3 \
	  -lopengl32 \
	  -lgdi32

INCLUDES = -I./includes -Ithird_party/imgui -Ithird_party/imgui/backends

WARNINGS=-w

FLAGS=-std=c++17 -DIMGUI_DISABLE_WIN32_FUNCTIONS

IMGUI_SRC = third_party/imgui/imgui.cpp third_party/imgui/imgui_draw.cpp \
	        third_party/imgui/imgui_tables.cpp third_party/imgui/imgui_widgets.cpp \
            third_party/imgui/backends/imgui_impl_glfw.cpp third_party/imgui/backends/imgui_impl_opengl3.cpp

OBJS = main.o $(IMGUI_SRC:.cpp=.o)

TARGET = hello_imgui

all: $(TARGET)

main.o: src/main.cpp
	$(CXX) $(CXXFLAGS) -c src/main.cpp -o main.o $(INCLUDES) $(WARNINGS) $(FLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@ $(INCLUDES) $(WARNINGS) $(FLAGS)

$(TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $@ $(INCLUDES) $(WARNINGS) $(FLAGS) $(LIBS)

clean:
	rm -rf $(OBJS) $(TARGET) $(TARGET).exe
